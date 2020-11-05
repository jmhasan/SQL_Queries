with etc as (
--Order qty
select d.xcus,d.xqty,0 xqtychl,0 xprime,xbloodgrp,xsimcardno from opdor h join opddt d on h.zid=d.zid and h.xdornum=d.xdornum
join cacus c on d.zid=c.zid and d.xcus=c.xcus where 
xconfirmt between '2018-09-01 06:00:00.00' and '2018-10-01 06:00:00.00' union all 
--Delivery Qty
select d.xcus,0 xqty,d.xqtychl,0 xprime,xbloodgrp,xsimcardno from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum 
 join cacus c on d.zid=c.zid and d.xcus=c.xcus
 where xconfirmt between '2018-09-01 06:00:00.00' and '2018-10-01 06:00:00.00' and xstatuschl='3-Invoiced' union all
--Payment amount
select xsub,0 xqty,0 xqtychl,xprime,xbloodgrp,xsimcardno from glheader h join gldetail d on h.zid=d.zid and h.xvoucher=d.xvoucher 
 join cacus c on d.zid=c.zid and d.xsub=c.xcus
 where xtrngl in ('CHQ-','BR--','JVNA','CR--','CRF-','JVI-','JV--') and xpostflag='Posted' and xstatusjv = 'Balanced' and xprime<0 and
 h.xdate between '2018-09-01' and '2018-09-30')
 select xbloodgrp,xsimcardno,sum(xqty/20) xqty,sum(xqtychl/20) xqtychl,sum(0-xprime) 
 xprime from etc where xsimcardno<>'Bag Plant' 
 group by xbloodgrp,xsimcardno order by xsimcardno