--Zone_and_Day_Wise_DA

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100000 and xdate  between '2021-09-01' and '2021-09-08' ) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xbloodgrp, ' + @ColumnName + ' from (select c.xbloodgrp,CONVERT(date,DATEADD(HOUR,-6,a.xconfirmt)) xymonthfrom,
  (xqtysms-xqtycut)/20 as xqtysms from opadvice a join cacus c on a.zid=c.zid and a.xcus=c.xcus
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between ''2021-09-01'' and ''2021-09-08'' and  xstatusadvmach<>''1-Open'' ) ps
    PIVOT(SUM(xqtysms) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery