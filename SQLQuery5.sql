USE [ContosoRetailDW]
GO

SELECT [ProductKey]
      ,[ProductLabel]
      ,[ProductName]
      ,[ProductDescription]
      ,[ProductSubcategoryKey]
      ,[Manufacturer]
      ,[BrandName]
      ,[ClassID]
      ,[ClassName]
      ,[StyleID]
      ,[StyleName]
      ,[ColorID]
      ,[ColorName]
      ,[Size]
      ,[SizeRange]
      ,[SizeUnitMeasureID]
      ,[Weight]
      ,[WeightUnitMeasureID]
      ,[UnitOfMeasureID]
      ,[UnitOfMeasureName]
      ,[StockTypeID]
      ,[StockTypeName]
      ,[UnitCost]
      ,[UnitPrice]
      ,[AvailableForSaleDate]
      ,[StopSaleDate]
      ,[Status]
      ,[ImageURL]
      ,[ProductURL]
      ,[ETLLoadID]
      ,[LoadDate]
      ,[UpdateDate]
  FROM [dbo].[DimProduct]

GO
USE [ContosoRetailDW]
GO

SELECT [SalesKey]
      ,[DateKey]
      ,[channelKey]
      ,[StoreKey]
      ,[ProductKey]
      ,[PromotionKey]
      ,[CurrencyKey]
      ,[UnitCost]
      ,[UnitPrice]
      ,[SalesQuantity]
      ,[ReturnQuantity]
      ,[ReturnAmount]
      ,[DiscountQuantity]
      ,[DiscountAmount]
      ,[TotalCost]
      ,[SalesAmount]
      ,[ETLLoadID]
      ,[LoadDate]
      ,[UpdateDate]
  FROM [dbo].[FactSales]

GO

select 
DimProduct.ProductName, 
MAX(FactSales.SalesAmount) as MAX_Sales_Amount,
MIN(FactSales.SalesAmount) as MIN_Sales_Amount,
AVG(FactSales.SalesAmount) as AVG_Sales_Amount,
Count(FactSales.SalesAmount) as Count_Sales_Amount
from DimProduct 
inner join
FactSales on DimProduct.ProductKey = FactSales.ProductKey 
where DimProduct.ProductName like'%420%' 
group by DimProduct.ProductName
having sum(FactSales.SalesAmount)>10000
order by DimProduct.ProductName 


--2. Apply Rank, Dense_Rank, Row_Number on same tables above and identity Rank based on SalesAmount for each of the ProdutNames.

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

----3. Use DimProductCategory and apply case statement. 
--if ProductCategoryName is Music, Movies and Audio Books then Change the value to YouTube.

select DimProductCategory.ProductCategoryDescription,
case
when DimProductCategory.ProductCategoryName like '%Music, Movies and Audio Books%'
then 'Youtube'
end
from 
DimProductCategory