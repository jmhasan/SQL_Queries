DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100000 and xdate between '2021-04-01' and '2021-05-23') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xbloodgrp,xcus,xorg,xdistrict,' + @ColumnName + ' from (select c.xbloodgrp,a.xcus,xorg,a.xdistrict, CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) xymonthfrom,
  xqtycut from opadvice a join cacus c on a.zid=c.zid and a.xcus=c.xcus
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between ''2021-04-01'' and ''2021-05-23'' and  xstatusadvmach=''5-Voided'' ) ps
    PIVOT(SUM(xqtycut) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery

