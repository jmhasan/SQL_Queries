select c.xbloodgrp,sum(xqty-xqtychl)/20 DORemaining from opdor h join opddt d on h.zid=d.zid and h.xdornum=d.xdornum 
join cacus c on c.zid=h.zid and c.xcus=h.xcus
where xstatusdor<>'C-Cancelled' and h.xdate<='2021-02-24' group by c.xbloodgrp having sum(d.xqty-d.xqtychl)>0

select xbloodgrp,sum(xqtychl/20) tillsales,
sum(case when xconfirmt between '2021-02-23 06:00:00' and '2021-02-24 06:00:00' then xqtychl/20 else 0 end) ondsales from 
opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum  join cacus c on c.zid=h.zid and c.xcus=h.xcus
where xstatuschl='3-Invoiced' and 
 xconfirmt between '2021-02-01 06:00:00' and '2021-02-24 06:00:00' --and h.xcus='CUS-000041'
group by xbloodgrp

---CUstomer wise sales
select xbloodgrp,c.xcus,xorg,sum(xqtychl)/20
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid=c.zid and h.xcus=c.xcus 
where xconfirmt between '2021-01-11 06:00:00.000' and '2021-01-12 06:00:00.000' and xsimcardno<>'Corporate'  
group by xbloodgrp,c.xcus,xorg
