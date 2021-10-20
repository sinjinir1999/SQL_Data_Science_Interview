WITH each_date
AS (
	SELECT request_date
		,avg(distance_to_travel / monetary_cost) AS distance_per_dollar
	FROM user_rides
	GROUP BY 1
	)
	,per_month
AS (
	SELECT date_trunc('month', request_date) AS month_year
		,avg(distance_to_travel / monetary_cost) AS distance_per_dollar
	FROM user_rides
	GROUP BY 1
	)
SELECT a.request_date
	,round(abs(cast(a.distance_per_dollar - b.distance_per_dollar) AS DECIMAL), 2) AS difference
FROM each_date a
JOIN per_month b ON date_trunc('month', a.request_date) = b.month_year
GROUP BY 1
ORDER BY 1
