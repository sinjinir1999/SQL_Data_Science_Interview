-- Query to fetch even records.

SELECT *
FROM Salaries
WHERE MOD(Emp_Id, 2) = 0

--OR

SELECT *
FROM (
	SELECT *
		,Row_Number() OVER (
			ORDER BY Emp_id
			) AS even_rows
	FROM Salaries
	) AS e
WHERE even_rows % 2 = 0
