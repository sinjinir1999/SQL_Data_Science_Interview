-- Query to betch bottom 4 records.

SELECT *
FROM (
	SELECT *
		,Row_Number(ORDER BY Salary) AS row_n
	FROM Salaries
	) as s
WHERE row_n > (
		SELECT count(*) - 4 From Salaries
		)
