
WITH cte_rides_days AS(
    SELECT 
    strftime('%Y-%m-%d', pickup_datetime) as date, 
    COUNT(id) AS count, 
    SUM(distance) AS dist_sum
    FROM taxi_trips
    WHERE date < '2010-01-01' AND date >= '2009-01-01'
    GROUP BY date
    UNION ALL
    SELECT 
    strftime('%Y-%m-%d', pickup_datetime) as date, 
    COUNT(id) AS count, 
    SUM(distance) AS dist_sum
    FROM uber_trips
    WHERE date < '2010-01-01' AND date >= '2009-01-01'
    GROUP BY date
),
all_rides_days AS(
    SELECT date, 
    SUM(count) AS total_count, 
    SUM(dist_sum) AS total_dist
    FROM cte_rides_days
    GROUP BY date
)
SELECT date, total_count, total_dist / total_count 
FROM all_rides_days 
ORDER BY total_count DESC LIMIT 10
