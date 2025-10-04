 SELECT
    user_id,
    session_id,
    app_name,
    cast(date(from_unixtime(timestamp / 1000)) AS timestamp) AS event_date,
    cast(date_diff('second', min(from_unixtime(timestamp / 1000)), max(from_unixtime(timestamp / 1000))) AS decimal(12,2)) AS session_duration_seconds
  FROM
    "icebase"."sys01".page_events_01
    group by 1,2,3,4