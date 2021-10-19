SELECT created_at
	,count(CASE 
			WHEN event_name = 'post'
				THEN 1
			ELSE NULL
			END) * 1.00 / count(CASE 
			WHEN event_name = 'enter'
				THEN 1
			ELSE NULL
			END) * 100 AS perc_success
FROM post_events
GROUP BY 1
ORDER BY 1
