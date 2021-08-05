with xyz as (
 select c.xbloodgrp xzone,d.xcus,c.xorg,
 (select coalesce((select xtypecat from opddt where zid=d.zid and xitem=d.xitem and xdornum=d.xdornum ),'Customer Bag'))  Bag_type,
xqtychl from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid =c.zid and h.xcus=c.xcus
 where xconfirmt BETWEEN '2021-03-01 06:00 ' and '2021-04-01 06:00'  and xstatuschl='3-Invoiced')
select xzone,xcus,xorg,Bag_type,sum(xqtychl/20) xqtychl from xyz where Bag_type like '%Bulk%'
group by xzone,xcus,xorg,Bag_type


