--SKU wise sales
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xdate between '2019-01-01' and '2020-01-31') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xzone,xitemold,' + @ColumnName + ' from (SELECT xzone,i.xitemold,cast(xyear as varchar)+''-''+ RIGHT(''00'' + CAST(xper AS varchar), 2) xymonthfrom,xqtychl/20 as xqtychl
    FROM opchallandt c join caitem i on c.zid=i.zid and c.xitem=i.xitem  where   xconfirmt between ''2019-01-01 06:00:00'' 
    and ''2020-02-01 06:00:00'' and xstatuschl<>''1-Open'' 
    and c.xitem not in (''28-01-001-0002'',''28-01-001-0003'',''28-01-001-0001'') ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery