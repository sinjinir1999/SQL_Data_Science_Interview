
/*
Salaries Differences:
Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. 
Output just the difference in salaries.[DROPBOX]
*/


SELECT abs(max(CASE 
				WHEN department_id = 1
					THEN salary
				END) - max(CASE 
				WHEN department_id = 4
					THEN salary
				END)) AS diff
FROM db_employee;
