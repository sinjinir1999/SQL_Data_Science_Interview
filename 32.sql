-- Calculate Corelation Coefficient [GOOGLE]
WITH Mean
AS (
	SELECT x1
		,x2
		,avg(x1) OVER () AS meanx1
		,avg(x2) OVER () AS meanx2
	FROM TABLE
	)
	,Variance
AS (
	SELECT avg(power(x1 - meanx1), 2) AS varx1.avg(power(x2 - meanx2), 2) AS varx2
	FROM Mean
	)
	,Standard_Deviation
AS (
	SELECT Power(varx1, 0.5) AS stdx1
		,power(varx2, 0.5) AS stdx2
	FROM Variance
	)
	,Covariance (SELECT Avg((x1 - meanx1) * (x2 - meanx2)) AS cov FROM Mean)
	,SELECT cov / (stdx1 * stdx2)
AS correlation_coeffient FROM Covariance
	,Standard_Deviation
