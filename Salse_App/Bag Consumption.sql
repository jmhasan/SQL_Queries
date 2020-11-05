with xyz as( select xwh, coalesce((select xcodealt from xcodes where zid=opchallandt.zid and xcode=opchallandt.xtypecat and xtype='Item Type'),'Customer Bag') Bag_type ,xqtychl,xtypecat,xdiv from opchallandt where xstatuschl='3-Invoiced' and xconfirmt between '2019-01-01 06:00:00.000' and '2020-01-01 06:00:00.000' and xdiv<>'Bag Plant') select Bag_type,sum(xqtychl/20) from xyz group by Bag_type

--Month wise report
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xyear between 2019 and 2020 ) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  Bag_type, ' + @ColumnName + ' from (select coalesce((select xcodealt from xcodes where zid=opchallandt.zid and xcode=opchallandt.xtypecat and xtype=''Item Type''),''Customer Bag'')
   Bag_type,xymonthfrom,xqtychl from opchallandt   where  xstatuschl=''3-Invoiced''
and xconfirmt between ''2019-01-01 06:00:00.000'' and ''2020-02-01 06:00:00.000'' and xdiv<>''Bag Plant'' ) ps
    PIVOT(SUM(xqtychl) FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery
