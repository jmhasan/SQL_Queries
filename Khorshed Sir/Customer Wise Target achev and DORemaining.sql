with abc as (
select xbloodgrp,h.xcus,c.xorg,
sum(d.xqtychl)/20 xqtychl,0 xqty  from  opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid=c.zid and h.xcus=c.xcus where  
xstatuschl='3-Invoiced' and c.xsimcardno<>'Bag Plant'  and CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt)) between'2021-09-01' and '2021-09-20'
group by xbloodgrp,h.xcus,c.xorg
union all 
select c.xbloodgrp ,t.xcus,c.xorg , 0 xqtychl, xqty/20 xqty from  cacustarget t join cacus c  on t.zid=c.zid and t.xcus=c.xcus where xyear=2021 and xper=9),abc2 as (
select xbloodgrp,xcus,xorg, xqtychl, xqty,
(select sum(xqty-xqtychl)/20  from opdor h join opddt d on h.zid=d.zid and h.xdornum=d.xdornum where h.xcus=abc.xcus and xstatusdor<>'C-Cancelled' and h.xdate<='2021-09-20' ) DORemaining
 from abc)
 select a.xbloodgrp,a.xcus,a.xorg,xgcus "Type",xdistrict District,
 xprbasicapp  "General Commission/Volume Commission",
 xprpfapp "Realistic Target Commission/Special Target Commission",
 xprbonusapp "Retail Commission",
 xpritaxapp "Lifting/Delivery commissions",
 xprarrearapp "Cash Discount offer/ Spot Discount offer",
 xprsuspapp "Free Bags Commission",
 xprsubsistapp "Yearly Commission",
 xpartial "Cash Party?",
 xprobe "Promotional Offer", a.xqty,a.xqtychl,a.DORemaining from abc2 a join cacus c on  a.xcus=c.xcus 


