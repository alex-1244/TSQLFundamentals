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

	SELECT [orderid]
		,SUM(unitprice*qty) as 'totalvalue'
		FROM [TSQL2012].[Sales].[OrderDetails]
		GROUP BY orderid
		HAVING SUM(unitprice*qty) >10000
		ORDER BY totalvalue DESC

	SELECT [custid]
		,[orderdate]
		,[orderid]
		,ROW_NUMBER() OVER(PARTITION BY custid ORDER BY orderdate, orderid) as 'rownum'
		FROM [TSQL2012].[Sales].[Orders]

	SELECT [custid]
			,[region]
	FROM [TSQL2012].[Sales].[Customers]
	ORDER BY CASE 
		when region  is not null then 0
			else 1 end;
