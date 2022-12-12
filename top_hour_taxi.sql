
WITH cte_hourly_taxi_trips AS(
    SELECT 
    strftime('%H',  pickup_datetime) AS hour, 
    COUNT(id) AS trip_counts
    FROM taxi_trips
    GROUP BY hour
)
SELECT * FROM cte_hourly_taxi_trips ORDER BY trip_counts DESC 
