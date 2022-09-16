--6.1. Use the Assignment 5 (2) use case and write the same query with the view. 

create view [vwRankPropetitie] as
select 
DimProduct.ProductKey,
DimProduct.ProductName,
FactSales.SalesAmount,
RANK() OVER(partition by DimProduct.ProductName ORDER BY FactSales.SalesAmount) Rank,
DENSE_RANK() over(partition by DimProduct.ProductName ORDER BY FactSales.SalesAmount) DENSE_RANK,
ROW_NUMBER() over(partition by DimProduct.ProductName ORDER BY FactSales.SalesAmount) ROW_NUMBER
from
DimProduct inner join FactSales on
DimProduct.ProductKey = FactSales.ProductKey
WHERE DimProduct.ProductName LIKE '%420%' AND FactSales.SalesAmount > 10000
drop view vwRankPropetitie;
select * from vwRankPropetitie
--6.2. Write a stored procedure that that uses the Assignment 5 (1) 
--use case and pass the parameter 420 into proc to get the result output. Also within the same proc insert the Assignment 

create proc spAggregateFunction 
@pattern varchar(20) 
as 
begin
select 
DimProduct.ProductName, 
MAX(FactSales.SalesAmount) as MAX_Sales_Amount,
MIN(FactSales.SalesAmount) as MIN_Sales_Amount,
AVG(FactSales.SalesAmount) as AVG_Sales_Amount,
Count(FactSales.SalesAmount) as Count_Sales_Amount
from DimProduct 
inner join
FactSales on DimProduct.ProductKey = FactSales.ProductKey 
where DimProduct.ProductName like @pattern 
group by DimProduct.ProductName
having sum(FactSales.SalesAmount)>10000
order by DimProduct.ProductName 
END

EXECUTE spAggregateFunction '%420%'

--6.3) use case data into temp table. show the out from temp table and then drop the temp table within the proc.
	SELECT * INTO dbo.#tmpRankPropetitie FROM [vwRankPropetitie];
	
	SELECT * FROM dbo.#tmpRankPropetitie

	DROP TABLE dbo.#tmpRankPropetitie
	
--6.4)View the definition of proc and view via sp_helptext  
 
 SP_HELPTEXT [vwRankPropetitie]

 SP_HELPTEXT spAggregateFunction

 --6.5) use the sys.objects and 

 SELECT * FROM sys.objects WHERE NAME = 'spAggregateFunction';
 
 SELECT * FROM sys.objects WHERE NAME = 'vwRankPropetitie';

 --6.6) sys.comments to view the view and sp defn.
 
 SELECT * FROM SYS.syscomments WHERE ID=446624634

 SELECT * FROM SYS.syscomments WHERE ID=462624691

--6.7)use exc command to run the proc.
 
  spAggregateFunction '%420%'
