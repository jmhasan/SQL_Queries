--SKU wise sales
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100010 and xdate between '2021-04-01' and '2021-07-11') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xcus,xorg,xzone,' + @ColumnName + ' from (select c.xcus,c.xorg,c.xbloodgrp as xzone,cast(CASE WHEN month(h.xconfirmt)= 1 AND day(h.xconfirmt) = 1 AND  convert(varchar,xconfirmt, 8) <= ''06:00:00'' THEN YEAR(h.xconfirmt)- 1
 ELSE YEAR(h.xconfirmt)  END  as varchar)+''-''+ RIGHT(''00'' + CAST(CASE WHEN month(h.xconfirmt) = 1 AND 
day(h.xconfirmt) = 1 AND convert(varchar,xconfirmt, 8) <= ''06:00:00'' THEN 12 WHEN
month(h.xconfirmt) > 1 AND day(h.xconfirmt) = 1 AND convert(varchar,xconfirmt, 8) <= ''06:00:00'' 
THEN month(h.xconfirmt) - 1 ELSE month(h.xconfirmt) END AS varchar), 2) xymonthfrom, 
  xqtychl/20 as xqtychl from  opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum  
join cacus c on c.zid=h.zid and c.xcus=h.xcus where xstatuschl=''3-Invoiced'' and  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between ''2021-04-01'' and ''2021-07-11'' and c.xsimcardno<>''Corporate'' ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery
