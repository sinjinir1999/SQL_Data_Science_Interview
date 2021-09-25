---POSTMAN
SELECT visited_on
	,ceil(avg_time_spent) AS avg_time_spent
FROM (
	SELECT visited_on
		,avg(time_spent) OVER (
			ORDER BY visited_on ROWS BETWEEN 2 PRECEDING
					AND CURRENT ROW
			) AS avg_time_spent
	FROM users AS u
	LEFT JOIN traffic t ON u.id = t.user_id
	WHERE user_type = 'user'
	GROUP BY 1
		,time_spent
	ORDER BY 1
	) AS t
