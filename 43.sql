WITH session
AS (
	SELECT a.user_id
		,a.TIMESTAMP AS DATE
		,MIN(b.TIMESTAMP - a.TIMESTAMP) AS duration
	FROM weblog a
	JOIN weblog b ON a.user_id = b.user_id
	WHERE a.action = 'page_load'
		AND b.action = 'page_exit'
		AND b.TIMESTAMP > a.TIMESTAMP
	GROUP BY 1
		,2
	)
SELECT user_id
	,avg(duration AS) avg_session
FROM session
GROUP BY 1
ORDER BY 2
