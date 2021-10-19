WITH ranked
AS (
	SELECT department
		,salary
		,dense_rank() OVER (
			PARTITION y department ORDER BY salary DESC
			) AS rank_id
	FROM twitter_employees
	)
SELECT DISTINCT department
	,salary
	,rank_id
FROM ranked
WHERE rank_id <= 3
ORDER BY 1
	,2 DESC
