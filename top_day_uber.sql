
WITH cte_daily_uber_trips AS(
    SELECT 
    strftime('%w',  pickup_datetime) AS hour, 
    COUNT(id) AS trip_counts
    FROM uber_trips
    GROUP BY hour
)
SELECT * FROM cte_daily_uber_trips ORDER BY trip_counts DESC 
