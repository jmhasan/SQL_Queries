DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100000 and xdate between '2021-01-01' and '2021-01-30') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xcus,xorg,xbloodgrp, ' + @ColumnName + ' from (select a.xcus,a.xorg,c.xbloodgrp, CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) xymonthfrom,
  xqtychl from opchallandt a join cacus c on a.zid=c.zid and a.xcus=c.xcus
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between ''2021-01-01'' and ''2021-01-30'' and  xstatuschl<>''1-Open'' 
 and a.xwh=''Mongla Cement Factory'') ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery

