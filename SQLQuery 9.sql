select dbo.FactSales.SalesKey,dbo.FactSales.DateKey,dbo.FactSales.channelKey,dbo.FactSales.ProductKey,dbo.FactSales.PromotionKey,

count(*)over (partition by dbo.FactSales.DateKey ) as partitionOnDateKey,
count(*)over (partition by dbo.FactSales.channelKey ) as partitionOnchannelKey,
count(*)over (partition by dbo.FactSales.ProductKey ) as partitionOnProductKey,
count(*)over (partition by dbo.FactSales.PromotionKey ) as partitionOnPromotionKey 
from dbo.FactSales;  

