--Month wise report
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT xdate as xymonthfrom FROM cadate 
where zid=100000 and xyear = 2020 and xper=11 ) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xzone,xwh,xcus,xorg,xshipcode,xtype,' + @ColumnName + ' from (select xzone,xwh,xcus,xorg,xshipcode,xtype,opchallandt.xdatecom,(opchallandt.xqtychl)/20  xqtychl from opchallandt 
     where  xstatuschl=''3-Invoiced'' and xdatecom between ''2020-11-01'' and ''2020-11-30'' and xdiv<>''Bag Plant'') ps
    PIVOT(SUM(xqtychl) FOR xdatecom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery