--Assignment 7.1
use ContosoRetailDW
CREATE FUNCTION fn_ConvertToUSCST(@diff int)
RETURNS SMALLDATETIME
AS
BEGIN
	RETURN DATEADD(MINUTE,-@diff,GETDATE());
END

SELECT dbo.fn_ConvertToUSCST(618) AS US_CST

SELECT GETDATE() AS IST


--Assignment 7.2

CREATE FUNCTION fn_ConvertTimeColumnToUS_CSTime(@difference int)
RETURNS TABLE
AS
RETURN (SELECT dimdate.Datekey AS US_CST,
		DATEADD(MINUTE,@difference,(Dimdate.datekey)) AS IST
		FROM DimDate)

SELECT * FROM dbo.fn_ConvertTimeColumnToUS_CSTime(630)


