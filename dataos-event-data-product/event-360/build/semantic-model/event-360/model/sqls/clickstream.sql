SELECT
  event_id,
  event_type,
  event_name,
  date(FROM_UNIXTIME("timestamp" / 1000)) as event_date,
  user_id,
  session_id,
  app_name
FROM
  icebase.sys01.page_events_01