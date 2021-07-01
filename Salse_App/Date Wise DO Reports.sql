DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100000 and xdate between '2020-11-01' and '2021-01-08') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xcus,xorg,xbloodgrp, ' + @ColumnName + ' from (select a.xcus,c.xorg,c.xbloodgrp,CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) xymonthfrom,
  xqty as xqtysms from opdorddt a join cacus c on a.zid=c.zid and a.xcus=c.xcus
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between ''2020-11-01 06:00'' and ''2021-01-08 06:00'' and xdiv<>''Bag Plant'' ) ps
    PIVOT(SUM(xqtysms) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery