-- Lag() and Lead()

SELECT emp_name
	,gender
	,salary
	,Lead(Salary, 2, - 1) OVER (
		ORDER BY salary
		) AS lead
	,Lag(Salary, 2, - 1) OVER (
		ORDER BY salary
		) AS lag
FROM Salaries
