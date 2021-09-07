--SKU wise sales
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xdate between '2020-11-01' and '2021-08-31') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xbloodgrp,xcus,xorg,' + @ColumnName + ' from (SELECT xbloodgrp,h.xcus,c.xorg,cast(year(xfdate) as varchar)+''-''+ RIGHT(''00'' + CAST(month(xfdate) AS varchar), 2) xymonthfrom,xqty
    FROM cacomslabRealistic h join cacus c on h.zid=c.zid and h.xcus=c.xcus  where  c.xsimcardno in (''Out Dhaka'',''Dhaka'') and xfdate between ''2020-11-01'' and ''2021-08-31''
     and c.xsimcardno in (''Out Dhaka'',''Dhaka'') ) ps
    PIVOT(SUM(xqty) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery


select * from cacomslabRealistic where xfdate='2021-03-01' 