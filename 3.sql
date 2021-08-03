/*
Display total salary of each employee
*/

SELECT emp_id
	,salary + incentive AS total_salary
FROM employee_salary
