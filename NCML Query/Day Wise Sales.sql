DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  xdate as xymonthfrom FROM cadate 
where zid=100010 and xdate between '2021-07-01' and '2021-07-25') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xcus,xorg,xbloodgrp, ' + @ColumnName + ' from (select h.xcus,c.xorg,c.xbloodgrp, CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) xymonthfrom,
  xqtychl from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid=c.zid and h.xcus=c.xcus
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between ''2021-07-01'' and ''2021-07-25'' and  xstatuschl<>''1-Open'' and   xsimcardno<>''Corporate'') ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery
