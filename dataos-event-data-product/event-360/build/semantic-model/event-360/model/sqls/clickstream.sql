 SELECT
    event_id,
    user_id,
    session_id,
    app_name,
    date(from_unixtime(timestamp / 1000)) AS event_date,
    date_diff('second', min(from_unixtime(timestamp / 1000)), max(from_unixtime(timestamp / 1000))) AS session_duration_seconds
  FROM
    "icebase"."sys01".page_events_01
    group by 1,2,3,4,5