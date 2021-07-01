DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT  DAY(xdate) as xymonthfrom FROM cadate 
where zid=100000 and xyear =2020 and xper=1) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xteam,name, ' + @ColumnName + ' from (SELECT xteam,(select xname from prmst where xemp=opchallandt.xteam ) as name,day(xconfirmt) xymonthfrom,xqtychl
    FROM opchallandt  where  xconfirmt between ''2020-01-01 06:00:00.000'' and  ''2020-01-31 06:00:00.000'' and xdiv<>''Corporate''  and xstatuschl=''3-Invoiced'' ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery