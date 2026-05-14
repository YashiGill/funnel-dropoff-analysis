-- QUERY 3: Price vs Conversion Analysis
-- Business Question: Does price affect purchase behavior?

SELECT
    event_type,
    ROUND(AVG(price)::NUMERIC, 2) AS avg_price,
    ROUND(MIN(price)::NUMERIC, 2) AS min_price,
    ROUND(MAX(price)::NUMERIC, 2) AS max_price,
    COUNT(*) AS total_events
FROM events
WHERE event_type IN ('view', 'cart', 'purchase')
GROUP BY event_type
ORDER BY avg_price DESC;