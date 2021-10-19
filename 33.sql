WITH Joined
AS (
	SELECT *
	FROM eu_energy
	
	UNION ALL
	
	SELECT *
	FROM asia_energy
	
	UNION ALL
	
	SELECT *
	FROM na_energy
	)
	,total_consumption
AS (
	SELECT DATE
		,sum(consumption) AS sum_consumption
	FROM joined
	GROUP BY 1
	)
SELECT DATE
	,sum_consumption
FROM total_consumption
WHERE sum_consumption = (
		SELECT max(sum_consumption)
		FROM total_consumption
		)
