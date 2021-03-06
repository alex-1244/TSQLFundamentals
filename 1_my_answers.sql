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

---------------------2 - JOINS------------------------

	SELECT [empid],
		[firstname],
		[lastname],
		n
	FROM [TSQL2012].[HR].[Employees] JOIN [TSQL2012].[dbo].[Nums]
	on n<=5

	SELECT [empid],
		DATEADD(day, n-1,'20090612')
	FROM [TSQL2012].[HR].[Employees] JOIN [TSQL2012].[dbo].[Nums]
	on n<6

	SELECT [Customers].[custid],
		COUNT(DISTINCT [Orders].[orderid]) as numorders,
		SUM(OD.qty) as totalqty
	FROM [TSQL2012].[Sales].[Customers] JOIN [TSQL2012].[Sales].[Orders]
	ON [Customers].[custid]=[Orders].[custid]
	JOIN [TSQL2012].[Sales].[OrderDetails] as OD
	ON [OD].[orderid]=[Orders].[orderid]
	WHERE [Customers].[country]='USA'
	GROUP BY [Customers].[custid]

	SELECT [C].[custid],
		[C].[companyname]
	FROM [TSQL2012].[Sales].[Customers] as C
	LEFT JOIN [TSQL2012].[Sales].[Orders] as O
	ON C.custid=O.custid
	WHERE O.orderid IS NULL

	SELECT [C].[custid],
		[C].[companyname],
		[O].[orderdate]
	FROM [TSQL2012].[Sales].[Customers] as C
	LEFT JOIN [TSQL2012].[Sales].[Orders] as O
	ON C.custid=O.custid
	WHERE O.orderdate = '20070212'
	
	SELECT [C].[custid],
		[C].[companyname],
		CASE WHEN [O].[orderdate] IS NULL THEN 'NO'
		ELSE 'YES' END,
		[O].[orderdate]
	FROM [TSQL2012].[Sales].[Customers] as C
	LEFT JOIN [TSQL2012].[Sales].[Orders] as O
	ON C.custid=O.custid
	AND O.orderdate = '20070212'

	

