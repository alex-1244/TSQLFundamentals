  USE TSQL2012;

  SELECT [orderid]
		,[orderdate]
		,[custid]
		,[empid]
	FROM [TSQL2012].[Sales].[Orders]
	WHERE [orderdate]=EOMONTH(orderdate)

  SELECT [orderid]
		,[orderdate]
		,[custid]
		,[empid]
	FROM [TSQL2012].[Sales].[Orders]
	WHERE [orderdate]>='20070601' AND [orderdate]<='20070701'


  SELECT [empid]
		,[firstname]
		,[lastname]
	FROM [TSQL2012].[HR].[Employees]
	WHERE lastname LIKE '%a%a%'