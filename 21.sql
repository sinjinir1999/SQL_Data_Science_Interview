--Where and Having 

SELECT order_id
	,SUM(unit_price * quantity) AS total_price
FROM Sales
WHERE order_id > 50000
GROUP BY 1
HAVING SUM(unit_price * quantity) > 50000
