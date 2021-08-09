-- Query to fetch odd records.

SELECT *
FROM Salaries
WHERE MOD(Emp_Id, 2) <> 0

--OR

SELECT *
FROM (
	SELECT *
		,Row_Number() OVER (
			ORDER BY Emp_id
			) AS odd_rows
	FROM Salaries
	) AS e
WHERE odd_rows % 2 <> 0
