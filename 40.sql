SELECT request_date
	,ROUND(ABS(Cast((distance_to_travel / monetary_cost) - avg(distance_to_travel / monetary_cost)
  OVER (PARTITION BY date_trunc('month', request_date)) AS DECIMAL)), 2) AS difference
FROM interviews.uber_rides
GROUP BY 1
ORDER BY 1
