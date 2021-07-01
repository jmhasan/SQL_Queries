 --Zone and District wise sales 
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xdate between '2021-01-01' and '2021-05-18') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select xzone,xdistrict,' + @ColumnName + ' from (SELECT xzone,xdistrict,cast(xyear as varchar)+''-''+ RIGHT(''00'' + CAST(xper AS varchar), 2) xymonthfrom,xqtychl/20 as xqtychl
    FROM opchallandt where xdatecom>=''2021-01-01'' and xdiv in (''Dhaka'',''Out Dhaka'',''Corporate'')  and xstatuschl<>''1-Open'' ) ps
    PIVOT(SUM(xqtychl) FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery