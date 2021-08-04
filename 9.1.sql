/*
Number of comments per user in Past 30 days [FACEBOOK].
*/

SELECT DISTINCT user_id
	,sum(number_of_comments) AS total_comments_per_user
FROM fb_comment_user
WHERE date(created_at) BETWEEN current_date-30
		AND current_date
GROUP BY 1
