--Dynamic Pivot

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xyear=2020 and xper between 6 and 9 ) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xzonedel,xstatustrn, ' + @ColumnName + ' from (select xzonedel,xstatustrn,convert(varchar(7),xconfirmt,126) as xconfirmt,(xqtycut/20) as xqtycut from opadvice where 
  xconfirmt between ''2020-06-01 06:00:00.000'' and  ''2020-09-18 06:00:00.000'' and xstatusadvmach=''5-Voided'') ps
    PIVOT(SUM(xqtycut) FOR xconfirmt IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery