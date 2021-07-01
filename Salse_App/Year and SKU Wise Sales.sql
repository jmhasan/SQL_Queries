with xyear as (
select xyear,xzone,xqtychl,xchlnum,xtypecat,xitem,xcus,

(select coalesce((select xcode from xmapbag where zid=opchallandt.zid 
and xtypecat=opchallandt.xtypecat and xitem=opchallandt.xitem),'Customer Bag'))  Bag_type 

from opchallandt where xzone in ('MYMENSINGH','GAZIPUR') and xyear BETWEEN '2016' and '2020'  
 and xstatuschl='3-Invoiced' and xdiv<>'Bag Plant')

 select xyear,xzone,Bag_type,sum(xqtychl/20) xqtychl
 from xyear GROUP by xyear,xzone,Bag_type 


