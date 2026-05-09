/*
================================================================================
  WFH SCHEDULER — SEED DATA SCRIPT
  Application : 102 - WFH Scheduler
  Tables      : wfh_schedules
  Coverage    : February, March, April, May 2026
  Users       : 1 = Dev Manager, 2 = Test Employee 1, 3 = Test Employee 2
  Sessions    : AM and PM per working day
  Note        : schedule_id is an identity column — not included in INSERT
================================================================================

  WHAT THIS GIVES YOUR REPORTS:
  - Page 3 (Heatmap)    : Current week (04-08 May) fully populated
  - Page 4 (Trends)     : 4 months of data showing realistic patterns
  - Page 5 (Manager)    : Anomaly detection has enough data to flag changes

  SAFE TO RUN: Uses DELETE first to avoid duplicate key errors
  Existing April data will be replaced with cleaner consistent data
================================================================================
*/

-- Clear existing schedule data first (safe — rebuilding with better coverage)
DELETE FROM wfh_schedules;
COMMIT;

/*
  FEBRUARY 2026 WORKING DAYS
  Mon 02 - Fri 06
  Mon 09 - Fri 13
  Mon 16 - Fri 20
  Mon 23 - Fri 27
*/

-- Week 1 Feb: 02-06 Feb
-- Dev Manager (1): mostly WFH, some FMH
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-02', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-02', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-03', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-03', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-04', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-04', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-05', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-05', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-06', 'PM', 'WFH');
-- Test Employee 1 (2): mix of WFH and AL
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-02', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-02', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-03', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-03', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-04', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-04', 'PM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-05', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-05', 'PM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-06', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-06', 'PM', 'FMH');
-- Test Employee 2 (3): mostly FMH (office-based pattern)
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-02', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-02', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-03', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-03', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-04', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-04', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-05', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-05', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-06', 'AM', 'APPT');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-06', 'PM', 'FMH');

-- Week 2 Feb: 09-13 Feb
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-09', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-10', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-10', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-11', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-11', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-12', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-12', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-13', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-13', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-09', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-09', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-10', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-10', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-11', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-11', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-12', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-12', 'PM', 'APPT');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-13', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-13', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-09', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-10', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-10', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-11', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-11', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-12', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-12', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-13', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-13', 'PM', 'FMH');

-- Week 3 Feb: 16-20 Feb
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-16', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-16', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-17', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-18', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-18', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-19', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-19', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-20', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-20', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-16', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-16', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-17', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-18', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-18', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-19', 'AM', 'APPT');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-19', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-20', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-20', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-16', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-16', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-17', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-18', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-18', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-19', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-19', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-20', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-20', 'PM', 'WFH');

-- Week 4 Feb: 23-27 Feb
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-24', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-25', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-25', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-26', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-26', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-27', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-02-27', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-23', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-24', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-25', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-25', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-26', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-26', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-27', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-02-27', 'PM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-24', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-24', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-25', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-25', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-26', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-26', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-27', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-02-27', 'PM', 'FMH');

COMMIT;

/*
  MARCH 2026
  Slightly higher WFH rate than February — shows upward trend in reports
*/

-- Week 1 Mar: 02-06 Mar
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-02', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-02', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-03', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-03', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-04', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-04', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-05', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-05', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-06', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-02', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-02', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-03', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-03', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-04', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-04', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-05', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-05', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-06', 'AM', 'APPT');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-06', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-02', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-02', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-03', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-03', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-04', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-04', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-05', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-05', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-06', 'PM', 'WFH');

-- Week 2 Mar: 09-13 Mar
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-09', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-10', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-10', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-11', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-11', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-12', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-12', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-13', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-13', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-09', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-10', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-10', 'PM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-11', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-11', 'PM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-12', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-12', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-13', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-13', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-09', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-10', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-10', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-11', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-11', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-12', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-12', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-13', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-13', 'PM', 'FMH');

-- Week 3 Mar: 16-20 Mar
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-16', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-16', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-17', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-18', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-18', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-19', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-19', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-20', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-20', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-16', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-16', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-17', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-18', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-18', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-19', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-19', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-20', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-20', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-16', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-16', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-17', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-18', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-18', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-19', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-19', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-20', 'AM', 'APPT');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-20', 'PM', 'WFH');

-- Week 4 Mar: 23-27 Mar
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-24', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-25', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-25', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-26', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-26', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-27', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-03-27', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-24', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-25', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-25', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-26', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-26', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-27', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-03-27', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-24', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-25', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-25', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-26', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-26', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-27', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-03-27', 'PM', 'WFH');

COMMIT;

/*
  APRIL 2026
  Employee 2 (user 3) increases WFH significantly vs March
  — this will trigger the anomaly flag on Page 5
*/

-- Week 1 Apr: 01-03 Apr (Wed-Fri only, Mon/Tue = Easter)
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-01', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-01', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-02', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-02', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-03', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-03', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-01', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-01', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-02', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-02', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-03', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-03', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-01', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-01', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-02', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-02', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-03', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-03', 'PM', 'WFH');

-- Week 2 Apr: 06-10 Apr
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-06', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-07', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-07', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-08', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-08', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-09', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-10', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-10', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-06', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-07', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-07', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-08', 'AM', 'APPT');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-08', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-09', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-10', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-10', 'PM', 'WFH');
-- Employee 2 going heavily WFH in April (anomaly trigger)
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-06', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-07', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-07', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-08', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-08', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-09', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-09', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-10', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-10', 'PM', 'WFH');

-- Week 3 Apr: 13-17 Apr
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-13', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-13', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-14', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-14', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-15', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-15', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-16', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-16', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-17', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-13', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-13', 'PM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-14', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-14', 'PM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-15', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-15', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-16', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-16', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-17', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-13', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-13', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-14', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-14', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-15', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-15', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-16', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-16', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-17', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-17', 'PM', 'WFH');

-- Week 4 Apr: 22-25 Apr (Fri 24 = good friday in some regions, keeping it)
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-22', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-22', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-23', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-24', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-25', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-04-25', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-22', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-22', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-24', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-25', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-04-25', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-22', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-22', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-23', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-23', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-24', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-24', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-25', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-04-25', 'PM', 'WFH');

COMMIT;

/*
  MAY 2026 — CURRENT WEEK (04-09 May)
  Today is Saturday 09 May — working week was Mon 04 to Fri 08
  This is what Page 3 Heatmap will show as "this week"
*/

-- Monday 04 May
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-04', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-04', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-04', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-04', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-04', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-04', 'PM', 'WFH');

-- Tuesday 05 May
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-05', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-05', 'PM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-05', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-05', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-05', 'AM', 'AL');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-05', 'PM', 'AL');

-- Wednesday 06 May
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-06', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-06', 'PM', 'APPT');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-06', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-06', 'PM', 'WFH');

-- Thursday 07 May
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-07', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-07', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-07', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-07', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-07', 'AM', 'FMH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-07', 'PM', 'FMH');

-- Friday 08 May
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-08', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (1, DATE '2026-05-08', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-08', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (2, DATE '2026-05-08', 'PM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-08', 'AM', 'WFH');
INSERT INTO wfh_schedules (user_id, schedule_date, time_session, status) VALUES (3, DATE '2026-05-08', 'PM', 'WFH');

COMMIT;

-- Verification query — run this after the script to confirm row counts
SELECT
    TO_CHAR(schedule_date, 'YYYY-MM')  AS month,
    COUNT(*)                           AS total_sessions,
    COUNT(CASE WHEN status = 'WFH'  THEN 1 END) AS wfh,
    COUNT(CASE WHEN status = 'FMH'  THEN 1 END) AS fmh,
    COUNT(CASE WHEN status = 'AL'   THEN 1 END) AS al,
    COUNT(CASE WHEN status = 'APPT' THEN 1 END) AS appt
FROM   wfh_schedules
GROUP BY TO_CHAR(schedule_date, 'YYYY-MM')
ORDER BY 1;
