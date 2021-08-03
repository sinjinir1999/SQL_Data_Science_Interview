/*
Query to fetch fullname and replace ' ' with '-'.
*/

SELECT REPLACE(full_name, " ", "-")
FROM employee_details
