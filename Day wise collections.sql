--Day wise collections 

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  DAY(xdate) as xymonthfrom FROM cadate 
where zid=100000 and xyear =2020 and xper=2) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xbloodgrp, ' + @ColumnName + ' from (select c.xbloodgrp,day(g.xdate) xymonthfrom,(0-xprime) xprime from glheaderdetail g join cacus c on g.zid=c.zid and g.xsub=c.xcus  where
 g.xdate between ''2020-02-01'' and ''2020-02-25'' and g.xprime<0 and c.xsimcardno<>''Bag Plant'' and 
xtrngl in (''CHQ-'',''BR--'',''JVNA'',''CR--'',''CRF-'',''JVI-'',''JV--'') and xpostflag=''Posted'' ) ps
    PIVOT(SUM(xprime) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery