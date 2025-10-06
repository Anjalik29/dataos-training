SELECT
    user_id,
    session_id,
    date(from_unixtime(timestamp / 1000)) AS event_date,
    array_join(array_agg(DISTINCT app_name), ', ') AS apps_used,
    CAST(
        date_diff(
            'second',
            min(from_unixtime(timestamp / 1000)),
            max(from_unixtime(timestamp / 1000))
        ) AS decimal(12,2)
    ) AS session_duration_seconds
FROM
    "icebase"."sys01".page_events_01
GROUP BY
    user_id,
    session_id,
    date(from_unixtime(timestamp / 1000));

