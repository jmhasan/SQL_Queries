--Dynamic Pivot

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xyear between 2018 and 2020) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xbloodgrp, ' + @ColumnName + ' from (select c.xbloodgrp,convert(varchar(7),CAST(g.xdate AS date) ,126) xymonthfrom,(0-xprime) xprime from glheaderdetail g join cacus c on g.zid=c.zid and g.xsub=c.xcus  where
 g.xdate >=''2018-01-01'' and g.xprime<0 and c.xsimcardno<>''Bag Plant'' and 
xtrngl in (''CHQ-'',''BR--'',''JVNA'',''CR--'',''CRF-'',''JVI-'',''JV--'') and xpostflag=''Posted'' ) ps
    PIVOT(SUM(xprime)
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery

