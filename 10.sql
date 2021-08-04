/*
Bottom 2 Companies by Mobile usage [MICROSOFT].
*/

SELECT customer_id
	,events
FROM (
	SELECT customer_id
		,count(*) AS events
		,Dense_rank() OVER (
			ORDER BY count(*)
			) AS Rank
	FROM fact_events
	WHERE client_id = 'Mobile'
	GROUP BY customer_id
	) AS A
WHERE rank <= 2
ORDER BY 2
