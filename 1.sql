/*
Fetch Duplicate Records in SQL.
*/

SELECT full_name
	,managerid
	,city
	,count(*)
FROM employee_details
GROUP BY 1
	,2
	,3
HAVING count(*) > 1
