--SKU wise sales
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100010 and xyear=2021) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xdatecom,' + @ColumnName + ' from (SELECT xdatecom,cast(xyear as varchar)+''-''+ RIGHT(''00'' + CAST(xper AS varchar), 2) xymonthfrom,xqtychl/20 as xqtychl
    FROM opchallandt c join cacus i on c.zid=i.zid and c.xcus=i.xcus  where  xstatuschl<>''1-Open'' and xdiv<>''Bag Plant'' and
     xdatecom between ''2021-01-01'' and ''2021-12-31'' ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery


