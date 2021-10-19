SELECT count(CASE 
			WHEN STATUS = 'closed'
				THEN 1
			ELSE NULL
			END) * 1.00 / + count(CASE 
			WHEN STATUS = 'closed'
				THEN 1
			ELSE NULL
			END) (
		count(CASE 
				WHEN STATUS = 'closed'
					THEN 1
				ELSE NULL
				END) + count(CASE 
				WHEN STATUS = 'open'
					THEN 1
				ELSE NULL
				END)
		) * 100 AS perc_closed
FROM account_status
WHERE DATE = '2020-01-10'
