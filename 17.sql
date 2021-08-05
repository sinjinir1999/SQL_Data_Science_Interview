/* 
Query to calculate the Cumulative Sum of the Salaries.
*/

SELECT *
	,SUM(Salary) OVER (
		ORDER BY EmpID
		) AS Cumulative_Sum
FROM Salaries
