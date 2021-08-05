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
  N'select  xzone,xcus,xorg, ' + @ColumnName + ' from (select xzone,xcus,xorg, CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) as xymonthfrom,
  xlineamt from opdorddt where CONVERT(date,DATEADD(HOUR,-6,xconfirmt))
   between ''2021-07-01'' and ''2021-07-25'' and xdiv<>''Corporate'' ) ps
    PIVOT(SUM(xlineamt) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery
