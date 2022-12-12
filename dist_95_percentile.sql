
WITH cte_distance AS(
    SELECT strftime('%Y-%m-%d', pickup_datetime) as date, distance
    FROM taxi_trips
    WHERE date < '2013-08-01' AND date >= '2013-07-01'
    UNION ALL
    SELECT strftime('%Y-%m-%d', pickup_datetime) as date, distance
    FROM uber_trips
    WHERE date < '2013-08-01' AND date >= '2013-07-01'
),
dist_percentile AS (
    SELECT distance, NTILE(100) OVER(ORDER BY distance ASC) AS percentile
    FROM cte_distance
)
SELECT MAX(distance) FROM dist_percentile WHERE percentile = 95
