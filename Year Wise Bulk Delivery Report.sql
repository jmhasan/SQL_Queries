with xyz as (
select xzone,xcus,xorg,xyear,xtypecat,xqtychl
from opchallandt where xyear='2012' 
and xstatuschl='3-Invoiced' and xdiv<>'Bag Plant' and xtypecat like '%Bulk%')
 select xzone,xcus,xorg,
 --jan
 sum(case when  xyear='2012' then xqtychl else 0 end )_2012,
  sum(case when  xyear='2013' then xqtychl else 0 end )_2013,
   sum(case when  xyear='2014' then xqtychl else 0 end )_2014,
    sum(case when  xyear='2015' then xqtychl else 0 end )_2015,
     sum(case when  xyear='2016' then xqtychl else 0 end )_2016,
      sum(case when  xyear='2017' then xqtychl else 0 end )_2017,
       sum(case when  xyear='2018' then xqtychl else 0 end )_2018,
        sum(case when  xyear='2019' then xqtychl else 0 end )_2019,
         sum(case when  xyear='2020' then xqtychl else 0 end )_2020,
          sum(case when  xyear='2021' then xqtychl else 0 end )_2021


from xyz   group by xzone,xcus,xorg


----

--SKU wise sales
DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct xyear as xymonthfrom FROM cadate 
where zid=100000 and xyear>='2012') AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xzone,xcus,xorg,' + @ColumnName + ' from (select xzone,xcus,xorg,xyear as xymonthfrom ,xqtychl/20 as xqtychl,
  (select coalesce((select xcode from xmapbag where zid=opchallandt.zid and xtypecat=opchallandt.xtypecat and xitem=opchallandt.xitem),''Customer Bag''))  Bag_type,
(select xitemold from caitem where zid=opchallandt.zid and xitem=opchallandt.xitem )item
from opchallandt where xyear> =''2012''
and xstatuschl=''3-Invoiced'' and xdiv<>''Bag Plant'' and  (select coalesce((select xcode from xmapbag where zid=opchallandt.zid 
and xtypecat=opchallandt.xtypecat and xitem=opchallandt.xitem),''Customer Bag''))=''Bulk'' ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery

