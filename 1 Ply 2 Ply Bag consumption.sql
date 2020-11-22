with xyz as (
select xzone,xper,xyear,(select coalesce((select xcode from xmapbag where zid=opchallandt.zid 
and xtypecat=opchallandt.xtypecat and xitem=opchallandt.xitem),'Customer Bag'))  Bag_type,
(select xitemold from caitem where zid=opchallandt.zid and xitem=opchallandt.xitem )item,xqtychl
from opchallandt where xconfirmt between  '2020-10-01 06:00:00.000' and '2020-11-21 06:00:00.000'
and xstatuschl='3-Invoiced' and xdiv<>'Bag Plant')
 select xzone,
   --oct
 sum(case when Bag_type='1 PLY' and xper='10'  then xqtychl else 0 end)oct_1_Ply,
 sum(case when Bag_type='2 PLY'  and xper='10' then xqtychl else 0 end)oct_2_Ply,
 sum(case when Bag_type='Bulk'  and xper='10' then xqtychl else 0 end )bulk_oct,
 coalesce(SUM (case when xper='10' then xqtychl end),0) Oct_Total,
--Nov 
sum(case when Bag_type='1 PLY'   and xper='11'  then xqtychl else 0 end)Nov_1_Ply,
 sum(case when Bag_type='2 PLY'   and xper='11' then xqtychl else 0 end)Nov_2_Ply,
 sum(case when Bag_type='Bulk'  and xper='11' then xqtychl else 0 end )bulk_nov,
 coalesce(SUM (case when xper='11' then xqtychl end),0) nov_Total,
 SUM(xqtychl) Total
from xyz group by xzone

select sum(xqtychl) from opchallandt where xconfirmt between 
'2020-11-01 06:00:00.000' and '2020-11-21 06:00:00.000' and 
 xstatuschl='3-Invoiced' and xdiv<>'Bag Plant'