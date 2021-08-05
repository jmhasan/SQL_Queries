with xyz as (

select h.xcus,xorg,xbloodgrp xzone,sum(d.xqtychl/20) totxqtychl
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid=c.zid and h.xcus=c.xcus where 
 CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) BETWEEN '2021-04-01' and '2021-04-30' 
and   xstatuschl='3-Invoiced' 
group by h.xcus,xorg,xbloodgrp)

select xcus,xorg,xzone,totxqtychl,
(select sum(xqtychl/20) from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum where CONVERT(date,DATEADD(HOUR,-6,xconfirmt))
 BETWEEN '2021-04-01' and '2021-04-30'and  xstatuschl='3-Invoiced' and h.xcus=xyz.xcus and d.xdornum in 
 (select xdornum from opdorddt where xconfirmt<='2021-03-10 06:00')) before10
  from  xyz 