with abc as (
select h.zid,h.xcus,sum(xqty-xqtychl)/20 DORemaining,0 DARemaining from opdor h join opddt d on h.zid=d.zid
 and h.xdornum=d.xdornum where xstatusdor<>'C-Cancelled' group by h.zid,h.xcus having sum(xqty-xqtychl)>0 
 union all 
 select zid,xcus,0 DORemaining,sum(xqtysms-xqtychl)/20 from opadvice where 
xstatusadvmach not in ('5-Voided','1-Open')  group by zid,xcus  having sum(xqtysms-xqtychl)/20>0),
abc2 as (
select xbloodgrp,a.xcus,c.xorg,sum(DORemaining) DORemaining,sum(DARemaining) DARemaining from abc a join cacus c on a.zid=c.zid and a.xcus=c.xcus where
 xsimcardno not in ('Bag Plant','Corporate','Office Sales') 
 group by xbloodgrp,a.xcus,c.xorg)

 select xbloodgrp Zone,xcus Cus_Code,xorg Cus_Name,(select max(xtsoid) from dealerfilter where xcus=abc2.xcus) AI_ID, dbo.empname((select max(xtsoid) from dealerfilter where xcus=abc2.xcus)) AI_Name,
  DORemaining,DARemaining from abc2



