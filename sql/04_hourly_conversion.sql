-- QUERY 4: Hourly Conversion Rate
-- Business Question: When do users convert best?

SELECT
    EXTRACT(HOUR FROM event_time) AS hour_of_day,
    COUNT(DISTINCT CASE WHEN event_type = 'view'
          THEN user_id END) AS viewers,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase'
          THEN user_id END) AS buyers,
    ROUND(COUNT(DISTINCT CASE WHEN event_type = 'purchase'
          THEN user_id END) * 100.0 /
          NULLIF(COUNT(DISTINCT CASE WHEN event_type = 'view'
          THEN user_id END), 0), 2) AS conversion_rate
FROM events
GROUP BY hour_of_day
ORDER BY conversion_rate DESC;