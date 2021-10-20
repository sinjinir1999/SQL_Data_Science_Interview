SELECT extract(month FROM created_at) AS months
	,ROUND((
			SUM(value) - lag(sum(value), 1) OVER (
				ORDER BY extract(month FROM created_at)
				)
			) / (
			lag(sum(value), 1) OVER (
				ORDER BY extract(month FROM created_at)
				)
			) * 100, 2) AS perc_diff
FROM transactions
GROUP BY 1
ORDER BY 1
