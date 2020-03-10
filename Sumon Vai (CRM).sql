select * from cacus where xpritaxapp='Yes'

select d.xcus,dbo.cusname(h.xcus),c.xbloodgrp,sum(d.xqtychl/20) from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum 
join cacus c on c.zid=d.zid and d.xcus=c.xcus
where xconfirmt between '2020-01-23 06:00:00.000' and '2020-01-29 06:00:00.000' and 
d.xcus in (select xcus from cacus where xpritaxapp='Yes') 
group by d.xcus,dbo.cusname(h.xcus),c.xbloodgrp

select d.xcus,SUM(xqtychl/20) from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum where d.xcus='CUS-000041'  and 
xconfirmt between '2020-01-23 06:00:00.000' and '2020-01-29 06:00:00.000'
group by d.xcus