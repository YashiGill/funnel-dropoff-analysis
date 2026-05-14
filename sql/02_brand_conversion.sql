-- QUERY 2: Brand Conversion Rate
-- Business Question: Which brands convert best and worst?

WITH brand_funnel AS (
    SELECT
        brand,
        COUNT(DISTINCT CASE WHEN event_type = 'view'
              THEN user_id END) AS viewers,
        COUNT(DISTINCT CASE WHEN event_type = 'purchase'
              THEN user_id END) AS buyers
    FROM events
    WHERE brand IS NOT NULL
    GROUP BY brand
    HAVING COUNT(DISTINCT CASE WHEN event_type = 'view'
                 THEN user_id END) >= 50
)
SELECT
    brand,
    viewers,
    buyers,
    ROUND(buyers * 100.0 / NULLIF(viewers, 0), 2) AS conversion_rate
FROM brand_funnel
ORDER BY conversion_rate DESC;