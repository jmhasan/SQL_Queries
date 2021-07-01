--Dynamic Pivot

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xyear between 2019 and 2020) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xdiv,xdistrict, ' + @ColumnName + ' from (SELECT (case when xdiv=''Corporate'' then xdiv else ''Trade'' end ) as xdiv,
  xdistrict,(cast( xyear as varchar(6))+''-''+ RIGHT(''00''+cast (xper as varchar),2)) as xymonthfrom,(xqtychl/20) as xqtychl
    FROM opchallandt  where   xconfirmt between ''2019-01-01 06:00:00.000'' and ''2020-03-01 06:00:00.000'' and
   xstatuschl=''3-Invoiced'' and xdiv<>''Bag plant'' ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery
