--SKU wise sales
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xdate between '2018-01-01' and '2020-12-19') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xcus,xorg,xzone,' + @ColumnName + ' from (SELECT c.xcus,c.xorg,c.xzone,cast(xyear as varchar)+''-''+ RIGHT(''00'' + CAST(xper AS varchar), 2) xymonthfrom,xqtychl/20 as xqtychl
    FROM opchallandt c join cacus i on c.zid=i.zid and c.xcus=i.xcus  where  xstatuschl<>''1-Open'' and xdiv<>''Bag Plant'' and i.ztime>=''2018-01-01 00:00'' ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery

