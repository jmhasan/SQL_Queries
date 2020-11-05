DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  DAY(xdate) as xymonthfrom FROM cadate 
where zid=100000 and xyear =2020 and xper=9) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xcus,xorg,xbloodgrp, ' + @ColumnName + ' from (select a.xcus,xorg,c.xbloodgrp,day(xconfirmt) xymonthfrom,
  xqtysms-xqtycut as xqtysms from opadvice a join cacus c on a.zid=c.zid and a.xcus=c.xcus
where xconfirmt between ''2020-09-01 06:00'' and ''2020-10-01 06:00'' and  xstatusadvmach<>''1-Open'' ) ps
    PIVOT(SUM(xqtysms) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery