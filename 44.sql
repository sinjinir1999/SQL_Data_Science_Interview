--Popularity % [FACEBOOK]
WITH base
AS (
	SELECT count(*) AS all_users
	FROM (
		SELECT DISTINCT user1
		FROM facebook_friends
		
		UNION
		
		SELECT DISTINCT user2
		FROM facebook_friends
		) AS t
	)
	,friends
AS (
	SELECT user1
		,user2
	FROM facebook_friends
	
	UNION
	
	SELECT user2 AS user1
		,user1 AS user2
	FROM facebook_friends
	)
	,final
AS (
	SELECT *
	FROM base
	JOIN friends ON 1 = 1
	)
SELECT user1
	,count(*) / max(all_users)::FLOAT
FROM final
GROUP BY 1
ORDER BY 1
