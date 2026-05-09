/*
================================================================================
  WFH SCHEDULER — REPORTING SUITE
  Application  : WFH Scheduler (Oracle APEX, Oracle Cloud Free Tier)
  Author       : Assisie Flora Arockiasamy
  Purpose      : Three analytical reports demonstrating advanced Oracle SQL
                 in a real deployed application

  REPORTS IN THIS FILE:
  ---------------------
  1. Team Calendar Heatmap
     Who is WFH vs office each week — weekly pattern by person and day

  2. Monthly WFH Trends
     Patterns over time — running totals, LAG comparison, moving average

  3. Manager Dashboard
     Team utilisation, day-of-week preferences, anomaly flagging

  WHAT THIS DEMONSTRATES FOR LEXISNEXIS INTERVIEW:
  -------------------------------------------------
  - Window functions in a real application context (not just theory)
  - PIVOT for cross-tab calendar layout
  - LAG for period comparison
  - RATIO_TO_REPORT for utilisation percentage
  - NTILE for banding / anomaly detection
  - CTEs for readable, maintainable query structure
  - APEX-specific integration notes (IR, charts, substitution strings)
================================================================================
*/


--------------------------------------------------------------------------------
-- SECTION 0: BASE TABLE REMINDER
-- (Your existing schema — reports build on these)
--------------------------------------------------------------------------------

/*
  WFH_USERS         : user_id, full_name, department, manager_id, is_active
  WFH_SCHEDULES     : schedule_id, user_id, schedule_date, status_id, notes
  WFH_STATUS_LOOKUP : status_id, status_code, status_label, counts_as_wfh
                      e.g. 1='WFH' Y, 2='Office' N, 3='Leave' N, 4='Sick' N

  Key design point to mention in interview:
  "counts_as_wfh flag on the lookup means my reports don't hardcode
   status values — adding a new status like 'Client Site' is one row
   in the lookup, and all reports adapt automatically."
*/


--------------------------------------------------------------------------------
-- SECTION 1: TEAM CALENDAR HEATMAP
-- "Who is WFH vs office each week"
--
-- Shows each team member's status for Mon-Fri of the current week
-- as a cross-tab (PIVOT). This is what the APEX Interactive Report
-- uses as its underlying query.
--
-- APEX usage: Classic Report with conditional cell highlighting
-- based on status_code value. WFH = green, Office = blue, Leave = amber.
--------------------------------------------------------------------------------

-- 1a. Current week heatmap — PIVOT by day of week
SELECT *
FROM (
    SELECT
        u.full_name,
        u.department,
        TO_CHAR(s.schedule_date, 'DY')   AS day_name,   -- MON TUE WED THU FRI
        sl.status_code                                   -- WFH / OFFICE / LEAVE
    FROM   wfh_schedules s
    JOIN   wfh_users u        ON u.user_id   = s.user_id
    JOIN   wfh_status_lookup sl ON sl.status_id = s.status_id
    WHERE  s.schedule_date BETWEEN TRUNC(SYSDATE, 'IW')          -- Monday
                               AND TRUNC(SYSDATE, 'IW') + 4      -- Friday
    AND    u.is_active = 'Y'
)
PIVOT (
    MAX(status_code)
    FOR day_name IN (
        'MON' AS mon,
        'TUE' AS tue,
        'WED' AS wed,
        'THU' AS thu,
        'FRI' AS fri
    )
)
ORDER BY department, full_name;

/*
  INTERVIEW TALKING POINT:
  "TRUNC(SYSDATE, 'IW') is an Oracle trick I use a lot — it truncates to
   the ISO week start (Monday), so the report always shows the current week
   regardless of when it runs. No hardcoded dates anywhere in the app."
*/

-- 1b. Any week — parameterised version for APEX date picker
--     In APEX: bind :P_WEEK_START to a date item (default = TRUNC(SYSDATE,'IW'))
SELECT *
FROM (
    SELECT
        u.full_name,
        u.department,
        TO_CHAR(s.schedule_date, 'DY')   AS day_name,
        sl.status_code
    FROM   wfh_schedules s
    JOIN   wfh_users u          ON u.user_id    = s.user_id
    JOIN   wfh_status_lookup sl ON sl.status_id = s.status_id
    WHERE  s.schedule_date BETWEEN TO_DATE(:P_WEEK_START, 'DD-MON-YYYY')
                               AND TO_DATE(:P_WEEK_START, 'DD-MON-YYYY') + 4
    AND    u.is_active = 'Y'
)
PIVOT (
    MAX(status_code)
    FOR day_name IN (
        'MON' AS mon, 'TUE' AS tue, 'WED' AS wed, 'THU' AS thu, 'FRI' AS fri
    )
)
ORDER BY department, full_name;

-- 1c. WFH count per person this week — used for the summary badge in APEX
SELECT
    u.full_name,
    u.department,
    COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)   AS wfh_days,
    COUNT(CASE WHEN sl.counts_as_wfh = 'N'
               AND sl.status_code = 'OFFICE' THEN 1 END)  AS office_days,
    COUNT(s.schedule_id)                                   AS days_submitted,
    5 - COUNT(s.schedule_id)                               AS days_missing
FROM   wfh_users u
LEFT JOIN wfh_schedules s
       ON s.user_id = u.user_id
      AND s.schedule_date BETWEEN TRUNC(SYSDATE, 'IW')
                              AND TRUNC(SYSDATE, 'IW') + 4
LEFT JOIN wfh_status_lookup sl ON sl.status_id = s.status_id
WHERE  u.is_active = 'Y'
GROUP BY u.user_id, u.full_name, u.department
ORDER BY u.department, u.full_name;

/*
  INTERVIEW TALKING POINT:
  "The days_missing column is important for managers — it flags who hasn't
   submitted their schedule yet. I used a LEFT JOIN so unsubmitted days
   appear as NULL rather than being excluded from the result.
   In APEX I highlight days_missing > 0 in amber using a column condition."
*/


--------------------------------------------------------------------------------
-- SECTION 2: MONTHLY WFH TRENDS
-- "Patterns over time — running totals, LAG, moving average"
--
-- This is the analytical heart of the reporting suite.
-- Designed to power a line chart in APEX (native chart region).
--
-- APEX usage: Chart Region (Line), x-axis = month, series = wfh_count
--             Second region: Classic Report showing the trend table
--------------------------------------------------------------------------------

-- 2a. Monthly WFH rate per person with LAG comparison
WITH monthly_wfh AS (
    SELECT
        u.user_id,
        u.full_name,
        u.department,
        TRUNC(s.schedule_date, 'MM')                          AS month_start,
        TO_CHAR(s.schedule_date, 'YYYY-MM')                   AS month_label,
        COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)   AS wfh_days,
        COUNT(s.schedule_id)                                   AS total_days_logged
    FROM   wfh_schedules s
    JOIN   wfh_users u          ON u.user_id    = s.user_id
    JOIN   wfh_status_lookup sl ON sl.status_id = s.status_id
    WHERE  u.is_active = 'Y'
    GROUP BY u.user_id, u.full_name, u.department,
             TRUNC(s.schedule_date, 'MM'),
             TO_CHAR(s.schedule_date, 'YYYY-MM')
)
SELECT
    full_name,
    department,
    month_label,
    wfh_days,
    total_days_logged,
    ROUND(wfh_days / NULLIF(total_days_logged, 0) * 100, 1)    AS wfh_pct,
    -- Previous month WFH days
    LAG(wfh_days) OVER (
        PARTITION BY user_id ORDER BY month_start)             AS prev_month_wfh,
    -- Month-on-month change
    wfh_days - LAG(wfh_days) OVER (
        PARTITION BY user_id ORDER BY month_start)             AS mom_change,
    -- 3-month rolling average
    ROUND(AVG(wfh_days) OVER (
        PARTITION BY user_id
        ORDER BY month_start
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 1)         AS rolling_3m_avg,
    -- Cumulative WFH days this year
    SUM(wfh_days) OVER (
        PARTITION BY user_id,
                     EXTRACT(YEAR FROM month_start)
        ORDER BY month_start
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)     AS ytd_wfh_days
FROM   monthly_wfh
ORDER BY full_name, month_start;


-- 2b. Team-level monthly trend — for the APEX line chart
--     One row per month, aggregated across all team members
SELECT
    TO_CHAR(s.schedule_date, 'YYYY-MM')                       AS month_label,
    TRUNC(s.schedule_date, 'MM')                              AS month_start,
    COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)       AS team_wfh_days,
    COUNT(s.schedule_id)                                       AS team_total_days,
    ROUND(
        COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)
        / NULLIF(COUNT(s.schedule_id), 0) * 100, 1
    )                                                          AS team_wfh_pct,
    -- Running total of WFH days across all time
    SUM(COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END))
        OVER (ORDER BY TRUNC(s.schedule_date, 'MM')
              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        )                                                      AS cumulative_wfh,
    -- MoM change in WFH percentage
    ROUND(
        COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)
        / NULLIF(COUNT(s.schedule_id), 0) * 100, 1
    ) - LAG(
        ROUND(
            COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)
            / NULLIF(COUNT(s.schedule_id), 0) * 100, 1
        )
    ) OVER (ORDER BY TRUNC(s.schedule_date, 'MM'))            AS pct_mom_change
FROM   wfh_schedules s
JOIN   wfh_users u          ON u.user_id    = s.user_id
JOIN   wfh_status_lookup sl ON sl.status_id = s.status_id
WHERE  u.is_active = 'Y'
GROUP BY TRUNC(s.schedule_date, 'MM'),
         TO_CHAR(s.schedule_date, 'YYYY-MM')
ORDER BY month_start;

/*
  INTERVIEW TALKING POINT:
  "The nested aggregate pattern — LAG of a SUM — is something Oracle handles
   cleanly with window functions but trips people up. You can't apply LAG
   directly to an aggregate in the same SELECT level, so I use the outer
   GROUP BY result as the window function input. In a more complex report
   I'd factor this into a CTE to keep it readable."
*/

-- 2c. Day-of-week preference analysis — which day do people most prefer WFH?
SELECT
    TO_CHAR(s.schedule_date, 'DY')                            AS day_name,
    TO_CHAR(s.schedule_date, 'D')                             AS day_num, -- for sort
    COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)       AS wfh_count,
    COUNT(s.schedule_id)                                       AS total_logged,
    ROUND(
        RATIO_TO_REPORT(
            COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)
        ) OVER () * 100, 1
    )                                                          AS pct_of_all_wfh,
    RANK() OVER (
        ORDER BY COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END) DESC
    )                                                          AS wfh_day_rank
FROM   wfh_schedules s
JOIN   wfh_status_lookup sl ON sl.status_id = s.status_id
JOIN   wfh_users u          ON u.user_id    = s.user_id
WHERE  u.is_active = 'Y'
AND    TO_CHAR(s.schedule_date, 'DY') NOT IN ('SAT', 'SUN')
GROUP BY TO_CHAR(s.schedule_date, 'DY'),
         TO_CHAR(s.schedule_date, 'D')
ORDER BY day_num;

/*
  INTERVIEW TALKING POINT:
  "This feeds a bar chart in APEX showing which days are most popular for WFH.
   RATIO_TO_REPORT gives the share of total WFH days without a subquery.
   In practice Friday and Monday tend to dominate — this chart lets a
   manager spot if the whole team is remote the same day."
*/


--------------------------------------------------------------------------------
-- SECTION 3: MANAGER DASHBOARD
-- "Team utilisation, day preferences, anomaly flagging"
--
-- The most complex report — designed for a manager-only APEX page
-- (controlled by APEX authorisation scheme checking is_manager flag)
--
-- APEX usage: Multiple regions on one page:
--   - Cards region: KPI summary (total WFH %, submissions missing)
--   - Interactive Report: per-person detail with anomaly flags
--   - Chart: utilisation by department (bar)
--------------------------------------------------------------------------------

-- 3a. Manager KPI summary — feeds APEX Cards region
SELECT
    COUNT(DISTINCT u.user_id)                                  AS team_size,
    COUNT(CASE WHEN s.schedule_date = TRUNC(SYSDATE)
               AND sl.counts_as_wfh = 'Y' THEN 1 END)         AS wfh_today,
    COUNT(CASE WHEN s.schedule_date = TRUNC(SYSDATE)
               AND sl.status_code = 'OFFICE' THEN 1 END)       AS office_today,
    -- Who hasn't submitted today
    COUNT(DISTINCT u.user_id) - COUNT(DISTINCT
        CASE WHEN s.schedule_date = TRUNC(SYSDATE)
             THEN s.user_id END)                               AS not_submitted_today,
    -- This week WFH rate
    ROUND(
        COUNT(CASE WHEN s.schedule_date BETWEEN TRUNC(SYSDATE,'IW')
                                            AND TRUNC(SYSDATE,'IW')+4
                   AND sl.counts_as_wfh = 'Y' THEN 1 END)
        / NULLIF(
            COUNT(CASE WHEN s.schedule_date BETWEEN TRUNC(SYSDATE,'IW')
                                                AND TRUNC(SYSDATE,'IW')+4
                       THEN 1 END), 0
        ) * 100, 1
    )                                                          AS week_wfh_pct
FROM   wfh_users u
LEFT JOIN wfh_schedules s     ON s.user_id   = u.user_id
LEFT JOIN wfh_status_lookup sl ON sl.status_id = s.status_id
WHERE  u.is_active = 'Y';


-- 3b. Per-person utilisation with anomaly detection — APEX Interactive Report
WITH person_monthly AS (
    SELECT
        u.user_id,
        u.full_name,
        u.department,
        TRUNC(s.schedule_date, 'MM')                           AS month_start,
        COUNT(CASE WHEN sl.counts_as_wfh = 'Y' THEN 1 END)    AS wfh_days,
        COUNT(s.schedule_id)                                    AS days_logged
    FROM   wfh_users u
    LEFT JOIN wfh_schedules s     ON s.user_id    = u.user_id
    LEFT JOIN wfh_status_lookup sl ON sl.status_id = s.status_id
    WHERE  u.is_active = 'Y'
    GROUP BY u.user_id, u.full_name, u.department,
             TRUNC(s.schedule_date, 'MM')
),
with_stats AS (
    SELECT
        user_id,
        full_name,
        department,
        month_start,
        wfh_days,
        days_logged,
        ROUND(wfh_days / NULLIF(days_logged, 0) * 100, 1)     AS wfh_pct,
        -- Average WFH days per month across the team
        ROUND(AVG(wfh_days) OVER (
            PARTITION BY department, month_start), 1)          AS dept_avg_wfh,
        -- Standard deviation — for anomaly detection
        ROUND(STDDEV(wfh_days) OVER (
            PARTITION BY department, month_start), 2)          AS dept_stddev,
        -- Quartile banding this month
        NTILE(4) OVER (
            PARTITION BY month_start
            ORDER BY wfh_days DESC)                            AS wfh_quartile,
        -- LAG for trend direction
        wfh_days - LAG(wfh_days) OVER (
            PARTITION BY user_id
            ORDER BY month_start)                              AS mom_delta
    FROM person_monthly
)
SELECT
    full_name,
    department,
    TO_CHAR(month_start, 'YYYY-MM')                            AS month,
    wfh_days,
    days_logged,
    wfh_pct,
    dept_avg_wfh,
    wfh_quartile,
    CASE wfh_quartile
        WHEN 1 THEN 'High WFH'
        WHEN 2 THEN 'Above average'
        WHEN 3 THEN 'Below average'
        WHEN 4 THEN 'Low WFH'
    END                                                        AS wfh_band,
    mom_delta,
    CASE
        WHEN mom_delta IS NULL THEN NULL
        WHEN mom_delta >= 3    THEN 'Significant increase'
        WHEN mom_delta <= -3   THEN 'Significant decrease'
        WHEN ABS(wfh_days - dept_avg_wfh) > (2 * dept_stddev)
             AND dept_stddev > 0
                               THEN 'Statistical outlier'
        ELSE NULL
    END                                                        AS anomaly_flag
FROM   with_stats
ORDER BY month_start DESC, department, full_name;

/*
  INTERVIEW TALKING POINT:
  "The anomaly flag uses two approaches: a simple threshold (delta of 3 days)
   for obvious changes, and a statistical approach using STDDEV as a window
   function for subtler outliers. STDDEV as an analytic function is not
   something most developers think to use — but it's available in Oracle
   and avoids a self-join to a stats subquery.

   In APEX I colour the anomaly_flag column with conditional formatting:
   red for significant decrease, amber for outlier, green for increase."
*/


-- 3c. Department utilisation comparison — feeds APEX bar chart
SELECT
    u.department,
    COUNT(DISTINCT u.user_id)                                  AS headcount,
    COUNT(CASE WHEN sl.counts_as_wfh = 'Y'
               AND s.schedule_date >= ADD_MONTHS(TRUNC(SYSDATE,'MM'), -3)
               THEN 1 END)                                     AS wfh_days_90d,
    COUNT(CASE WHEN s.schedule_date >= ADD_MONTHS(TRUNC(SYSDATE,'MM'), -3)
               THEN 1 END)                                     AS total_days_90d,
    ROUND(
        COUNT(CASE WHEN sl.counts_as_wfh = 'Y'
                   AND s.schedule_date >= ADD_MONTHS(TRUNC(SYSDATE,'MM'), -3)
                   THEN 1 END)
        / NULLIF(
            COUNT(CASE WHEN s.schedule_date >= ADD_MONTHS(TRUNC(SYSDATE,'MM'), -3)
                       THEN 1 END), 0
        ) * 100, 1
    )                                                          AS wfh_pct_90d,
    RANK() OVER (
        ORDER BY
            COUNT(CASE WHEN sl.counts_as_wfh = 'Y'
                       AND s.schedule_date >= ADD_MONTHS(TRUNC(SYSDATE,'MM'), -3)
                       THEN 1 END)
            / NULLIF(
                COUNT(CASE WHEN s.schedule_date >= ADD_MONTHS(TRUNC(SYSDATE,'MM'), -3)
                           THEN 1 END), 0
            ) DESC
    )                                                          AS utilisation_rank
FROM   wfh_users u
LEFT JOIN wfh_schedules s      ON s.user_id    = u.user_id
LEFT JOIN wfh_status_lookup sl ON sl.status_id = s.status_id
WHERE  u.is_active = 'Y'
GROUP BY u.department
ORDER BY wfh_pct_90d DESC NULLS LAST;


--------------------------------------------------------------------------------
-- SECTION 4: APEX IMPLEMENTATION NOTES
-- (Read this before Tuesday — shows you think end-to-end)
--------------------------------------------------------------------------------

/*
  HOW THESE REPORTS ARE WIRED IN APEX:
  -------------------------------------

  REPORT 1 — Team Calendar Heatmap (Page 3)
    Region type  : Classic Report
    Source query : Section 1a (current week) or 1b (with date picker)
    Column attrs : MON/TUE/WED/THU/FRI columns have Conditional Background:
                   WFH    = #D4EDDA (green)
                   OFFICE = #D1ECF1 (blue)
                   LEAVE  = #FFF3CD (amber)
                   NULL   = #F8D7DA (red — not submitted)
    Page item    : P3_WEEK_START (Date Picker, default = TRUNC(SYSDATE,'IW'))
    Dynamic action: On change of P3_WEEK_START → Refresh report region

  REPORT 2 — Monthly Trends (Page 4)
    Region 1     : APEX native Line Chart
                   Source: Section 2b (team totals)
                   Series: team_wfh_pct (line), rolling avg (dashed line)
                   X-axis: month_label
    Region 2     : Interactive Report
                   Source: Section 2a (per-person detail)
                   Default columns shown: full_name, month_label, wfh_pct,
                                          mom_change, rolling_3m_avg
    Region 3     : Bar Chart — Section 2c (day of week preference)

  REPORT 3 — Manager Dashboard (Page 5)
    Authorisation: Custom auth scheme — checks WFH_USERS.is_manager = 'Y'
                   for APP_USER (v('APP_USER') bind)
    Region 1     : Cards — Section 3a KPIs (team_size, wfh_today, not_submitted)
    Region 2     : Interactive Report — Section 3b with anomaly flags
                   Highlight rule: anomaly_flag IS NOT NULL → row highlight
    Region 3     : Bar Chart — Section 3c department comparison

  KEY APEX TALKING POINT:
  "I use bind variables (:P_WEEK_START) rather than dynamic SQL for the
   date filter — it's safer (no injection risk) and Oracle can share the
   cursor across sessions. The APEX session state manages the bind value
   automatically when the page item changes."

  AUTHORISATION TALKING POINT:
  "The manager page uses a page-level authorisation scheme so a regular
   user who navigates directly to page 5 gets an access denied message,
   not just hidden UI elements. Defence in depth — hiding the menu item
   is UX, the auth scheme is actual security."
*/

-- END OF REPORTING SUITE
