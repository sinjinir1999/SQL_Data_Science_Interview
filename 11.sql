/*
Lowest Revenue Generated Resteaurants (Bottom 2%) [DOOR DASH].
*/


SELECT restaurant_id
	,total_order
FROM (
	SELECT restaurant_id
		,sum(order_total) AS total_order
		,Ntile(50) OVER (
			ORDER BY sum(order_total)
			) AS N_percent
	FROM door_dash_delivery
	WHERE customer_place_order_datetime BETWEEN '2020-05-01'
			AND '2020-05-31'
	GROUP BY 1
	) AS A
WHERE N_percent = 1
ORDER BY 2
