/*  Ntile() */

SELECT empid
	,gender
	,dept
	,salary
	,ntile(5) OVER (
		PARTITION BY gender ORDER BY salary
		) AS ntile
FROM salaries
