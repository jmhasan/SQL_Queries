DECLARE @fxdate AS date
DECLARE @txdate AS date
SET @fxdate = '2021-08-01'
SET @txdate = '2021-08-14';

--SKU and Day  wise Sales 
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100000 and xdate between @fxdate and @txdate ) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  Bag_Type, ' + @ColumnName + ' from (select (select xitemold from caitem where zid=opchallandt.zid and xitem=opchallandt.xitem )+'' ''+
 (select coalesce((select xcode from xmapbag where zid=opchallandt.zid and xtypecat=opchallandt.xtypecat and xitem=opchallandt.xitem),''Customer Bag'')) Bag_Type,
 CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) xymonthfrom, xqtychl from opchallandt where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) 
 BETWEEN ''2021-08-01'' and ''2021-08-14''
and  xstatuschl=''3-Invoiced'' and xdiv<>''Bag Plant'') ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery