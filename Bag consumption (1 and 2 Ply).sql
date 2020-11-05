with xyz as (
select xzone,(select coalesce((select xcodealt from xcodes where xcodes.zid=opchallandt.zid 
and xcode=opchallandt.xtypecat and xcodes.xtype='Item Type'),'Customer Bag'))  Bag_type,xqtychl
--(select xqtybag from cabagconsum where zid=opchallandt.zid and xzone=opchallandt.xzone) xqtybag 
from opchallandt where xconfirmt between  '2020-06-01 06:00:00.000' and '2020-06-30 06:00:00.000'
and xstatuschl='3-Invoiced' and xdiv<>'Bag Plant')

 select xzone,sum(case when Bag_type='1 PLY' then xqtychl else 0 end)Bag_type_1,
 sum(case when Bag_type='2 PLY' then xqtychl else 0 end )Bag_type_2,SUM(xqtychl) Total,
 coalesce((select xqty from cabagconsum where xzone=xyz.xzone),0) xqty ,
 coalesce((select xqtybag from cabagconsum where xzone=xyz.xzone),0)xqtybag,
coalesce((select xqty from cabagconsum where xzone=xyz.xzone),0)+coalesce((select xqtybag from cabagconsum where xzone=xyz.xzone),0)Total 
from xyz where coalesce((select xqty from cabagconsum where xzone=xyz.xzone),0)+coalesce((select xqtybag from cabagconsum where xzone=xyz.xzone),0) <>0 
group by xzone


with xyz as (
select xcus,(select coalesce((select xcodealt from xcodes where xcodes.zid=opchallandt.zid 
and xcode=opchallandt.xtypecat and xcodes.xtype='Item Type'),'Customer Bag'))  Bag_type,xqtychl
--(select xqtybag from cabagconsum where zid=opchallandt.zid and xzone=opchallandt.xzone) xqtybag 
from opchallandt where xconfirmt between  '2020-06-01 06:00:00.000' and '2020-06-30 06:00:00.000'
and xstatuschl='3-Invoiced' and xdiv<>'Bag Plant')

select xcus,dbo.cusname(xcus) as Cus_Name,sum(case when Bag_type='1 PLY'  then xqtychl else 0 end)Bag_type_1,
sum(case when Bag_type='2 PLY'  then xqtychl else 0 end )Bag_type_2,SUM(xqtychl) Total,
coalesce((select xqty from cabagconsumd where xcus=xyz.xcus),0) xqty ,coalesce((select xqtybag from cabagconsumd where xcus=xyz.xcus),0)xqtybag,
coalesce((select xqty from cabagconsumd where xcus=xyz.xcus),0)+coalesce((select xqtybag from cabagconsumd where xcus=xyz.xcus),0) Total
 from xyz where coalesce((select xqty from cabagconsumd where xcus=xyz.xcus),0)+coalesce((select xqtybag from cabagconsumd where xcus=xyz.xcus),0) <>0
  group by xcus