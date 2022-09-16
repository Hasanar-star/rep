USE [ContosoRetailDW]


select *from dbo.DimGeography
select * from dbo.DimStore

--inner join

select 
dbo.DimGeography.GeographyKey, 
dbo.DimGeography.ContinentName as GeographyKeyContintName, 
dbo.DimStore.GeographyKey as StoreGeographyKey, 
dbo.DimStore.StoreName 
from
dbo.DimGeography inner join  dbo.DimStore on
dbo.DimGeography.GeographyKey=dbo.DimStore.GeographyKey

--full join
select 
dbo.DimGeography.GeographyKey, 
dbo.DimGeography.ContinentName as GeographyKeyContintName, 
dbo.DimStore.GeographyKey as StoreGeographyKey, 
dbo.DimStore.StoreName 
from
dbo.DimGeography full join  dbo.DimStore on
dbo.DimGeography.GeographyKey=dbo.DimStore.GeographyKey

--left outer join
select 
dbo.DimGeography.GeographyKey, 
dbo.DimGeography.ContinentName as GeographyKeyContintName, 
dbo.DimStore.GeographyKey as StoreGeographyKey, 
dbo.DimStore.StoreName 
from
dbo.DimGeography left outer join  dbo.DimStore on
dbo.DimGeography.GeographyKey=dbo.DimStore.GeographyKey

--right outer join
select 
dbo.DimGeography.GeographyKey, 
dbo.DimGeography.ContinentName as GeographyKeyContinentName, 
dbo.DimStore.GeographyKey as StoreGeographyKey, 
dbo.DimStore.StoreName 
from
dbo.DimGeography right outer join  dbo.DimStore on
dbo.DimGeography.GeographyKey=dbo.DimStore.GeographyKey

--3. Write left outer join equivalent query of inner join Table to use : 
----[dbo].[DimGeography], [dbo].[DimStore] FILTER to use: (Where condition) where StoreName='Contoso Bellevue Store'.

select 
dbo.DimGeography.GeographyKey,
dbo.DimGeography.ContinentName as GeographyKeyContinentName,
dbo.DimStore.GeographyKey as storeGeographyKey,
dbo.DimStore.StoreName
from 
dbo.DimGeography left join dbo.DimStore on
dbo.DimGeography.GeographyKey = dbo.DimStore.GeographyKey
where dbo.DimStore.StoreName like '%Contoso Bellevue Store%'


