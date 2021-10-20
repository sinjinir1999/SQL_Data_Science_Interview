WITH actual
AS (
	SELECT extract(month FROM request_date) AS months
		,sum(distance_to_travel) / sum(monetary_cost) AS distance_per_dollar_actual
	FROM request_logs
	GROUP BY 1
	ORDER BY 1
	)
	,model
AS (
	SELECT months
		,distance_per_dollar_actual
		,lag(distance_per_dollar_actual, 1) OVER (
			ORDER BY months
			) AS distance_per_dollar_model
	FROM actual
	GROUP BY 1
		,2
	ORDER BY 1
	)
SELECT SQRT(AVG(power(distance_per_dollar_actual - distance_per_dollar_model, 2))) AS rsme
FROM model
