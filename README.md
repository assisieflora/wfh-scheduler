# WFH Scheduler

A work-from-home scheduling application built with Oracle APEX and deployed on Oracle Cloud Free Tier.

## Overview

WFH Scheduler allows team members to submit their daily work location (AM and PM sessions) and managers to view team patterns through analytical reports.

## Tech Stack

- Oracle APEX 24.2
- Oracle Database (Oracle Cloud Free Tier)  
- PL/SQL for all business logic and dynamic reports
- JavaScript for client-side PDF print functionality


## Application Pages

| Page | Name | Description |
|------|------|-------------|
| 1 | Dashboard | Weekly schedule view with AM/PM session submission. PDF print via browser |
| 2 | Update Schedule | Modal dialog — MERGE-based upsert |
| 3 | Team Heatmap | Colour-coded weekly view of all team members |
| 4 | Monthly Trends | Analytical report — trends, running totals, MoM comparison |

## Key Technical Features

### MERGE Statement (Page 2)
Schedule submission uses MERGE — insert if new, update if exists. No duplicate key errors regardless of whether the user is submitting for the first time or updating.

### PL/SQL Dynamic Content Reports (Pages 3 and 4)
All reports are built using PL/SQL Dynamic Content regions — full control over HTML output, colour coding and layout.

### Analytical SQL Concepts Used
- Conditional aggregation — `COUNT(CASE WHEN status = 'WFH' THEN 1 END)`
- Running totals — cumulative WFH sessions across months
- Month-on-month comparison — LAG pattern implemented via PL/SQL cursor variable
- `TRUNC(date, 'MM')` for correct chronological grouping and sorting
- `TRUNC(date, 'IW')` for ISO week start (always Monday)
- `NULLIF` for divide-by-zero protection in percentage calculations

### Status Lookup Table Design
All status codes, display text and emojis are driven by `WFH_STATUS_LOOKUP` table. Adding a new status requires one INSERT — no code changes in any report.

## Database Schema

```sql
WFH_USERS        -- user_id, full_name, role, email, manager_id
WFH_SCHEDULES    -- schedule_id (identity), user_id, schedule_date, 
                 -- time_session (AM/PM), status
WFH_STATUS_LOOKUP -- status_code, status_text, status_emoji, 
                  -- display_order, is_active
```

## Screenshots

See `/screenshots` folder.

## SQL Scripts

| File | Description |
|------|-------------|
| `sql/wfh_seed_data.sql` | 4 months of realistic test data |
| `sql/wfh_reports.sql` | Analytical report queries with explanations |

## Deployment

Deployed and running on Oracle Cloud Free Tier (Always Free).
