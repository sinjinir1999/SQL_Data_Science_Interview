/* 
Query to fetch first three initials.
*/

SELECT substring(full_name, 1, 3)
FROM employee_details
