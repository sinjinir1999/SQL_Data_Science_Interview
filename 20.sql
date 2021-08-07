/* Rank() and Dense_Rank() */

SELECT emp_name
	,dept
	,salary
	,Rank() OVER (
		PARTITION BY gender ORDER BY Salary
		) AS rank
	,Dense_Rank() OVER (
		PARTITION BY gender ORDER BY Salary
		) AS denserank
FROM Salary
