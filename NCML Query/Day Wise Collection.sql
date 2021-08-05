--Day wise collections 

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100010 and xdate between '2021-07-01' and '2021-07-25' ) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xbloodgrp,xcus,xorg, ' + @ColumnName + ' from (select c.xbloodgrp,c.xcus,c.xorg,g.xdate xymonthfrom,(0-xprime) xprime from glheaderdetail g join cacus c on g.zid=c.zid and g.xsub=c.xcus  where
 g.xdate between ''2021-07-01'' and ''2021-07-25'' and g.xprime<0  and 
xtrngl in (''BR--'',''CR--'') and xpostflag=''Posted'' ) ps
    PIVOT(SUM(xprime) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery
