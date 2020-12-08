

with abb as(
select c.xbloodgrp zone,(case when convert(varchar, xconfirmt, 8) between '06:00:00' and '13:59:59' then 'A'
 when convert(varchar, xconfirmt, 8) between '14:00:00' and '21:59:59' then 
 'B' else 'C' end ) xshift,xqtychl/20 xqtychl  from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on h.zid=c.zid and h.xcus=c.xcus where h.xconfirmt>='2020-11-01 06:00' and xsimcardno<>'Bag Plant')

select zone,xshift,sum(xqtychl) from abb group by zone,xshift  order by zone,xshift