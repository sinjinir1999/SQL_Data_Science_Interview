SELECT num_comments
	,count(user_id) AS num_users
FROM (
	SELECT user_id
		,count(body) AS num_comments
	FROM users u
	JOIN comments c ON u.id = c.user_id
	WHERE created_at BETWEEN '2020-01-01'
			AND '2020-01-31'
		AND joined_at BETWEEN '2028-01-01'
			AND '2020-01-31'
		AND joined_at < created_at
	GROUP BY 1
	) AS comm
GROUP BY 1
ORDER BY 1
