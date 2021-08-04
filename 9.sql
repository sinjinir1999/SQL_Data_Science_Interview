/*
Number of comments per user in Past 30 days [FACEBOOK].
*/

SELECT DISTINCT user_id
	,sum(number_of_comments) AS total_comments_per_user
FROM fb_comment_user
WHERE created_at BETWEEN ('2020-02-10'::DATE - 30 * interval '1 Day')
		AND '2020-02-10'::DATE
GROUP BY 1
