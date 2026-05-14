-- QUERY 1: Funnel Analysis - Users at Each Stage
-- Business Question: Where are users dropping off?

SELECT
    event_type,
    COUNT(DISTINCT user_id) AS unique_users,
    ROUND(COUNT(DISTINCT user_id) * 100.0 /
        MAX(COUNT(DISTINCT user_id)) OVER (), 2) AS pct_of_total
FROM events
WHERE event_type IN ('view', 'cart', 'purchase')
GROUP BY event_type
ORDER BY unique_users DESC;