DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100000 and xyear =2021 and xper=6) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xcus,xorg,xbloodgrp, ' + @ColumnName + ' from (select a.xcus,xorg,c.xbloodgrp,CONVERT(date,DATEADD(HOUR,-6,a.xconfirmt)) xymonthfrom,
  xqtysms-xqtycut as xqtysms from opadvice a join cacus c on a.zid=c.zid and a.xcus=c.xcus
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between ''2021-06-01'' and ''2021-06-30'' and  xstatusadvmach<>''1-Open'' ) ps
    PIVOT(SUM(xqtysms) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery