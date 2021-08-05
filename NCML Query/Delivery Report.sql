with xyz as (

select h.xcus,c.xorg,c.xbloodgrp xzone,sum(xqtychl/20) totxqtychl
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid =c.zid and h.xcus=c.xcus
 where xconfirmt BETWEEN '2021-03-01 06:00 ' and '2021-04-01 06:00'  and xstatuschl='3-Invoiced' and c.xsimcardno<>'Corporate'
group by h.xcus,c.xorg,c.xbloodgrp)

select xyz.xcus,xorg,xzone,totxqtychl,
(select sum(xqtychl/20) from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid =c.zid and h.xcus=c.xcus
 where xconfirmt BETWEEN '2021-03-01 06:00 ' and '2021-04-01 06:00'  and xstatuschl='3-Invoiced' and  h.xcus=xyz.xcus and c.xsimcardno<>'Corporate' and 
 d.xdornum in ( select xdornum from opdorddt where xconfirmt<='2021-03-10 06:00')) from  xyz 


