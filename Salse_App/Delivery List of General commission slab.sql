with xyz as (
select d.xcus,c.xorg,c.xbloodgrp xzone,xqtychl, 
(case when (select xdate from opdor where xdornum=d.xdornum)>='2021-03-10' then xqtychl else 0 end) after10, 
(case when (select xdate from opdor where xdornum=d.xdornum)<='2021-03-09' then xqtychl else 0 end) before10
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on c.zid=h.zid and c.xcus=h.xcus
 where  xstatuschl='3-Invoiced' and xconfirmt between '2021-03-01 06:00:00.000' and '2021-04-01 06:00:00.000'
 and xprbasicapp='Yes' and xsimcardno <>'Corporate' and  xsimcardno<>'Bag Plant')
select xzone,xcus,xorg,sum(xqtychl)/20 xqtychl,sum(after10)/20 after10,
sum(before10)/20 before10,
(select xdiscamt from cacomslab where xcus=xyz.xcus and 
xminqty<=sum(xqtychl)/20 and xmaxqty>=sum(xqtychl)/20 and xtype='General Commission' 
and zactive='1') xdiscamt,
(select xamtret from cacomslab where xcus=xyz.xcus and 
xminqty<=sum(xqtychl)/20 and xmaxqty>=sum(xqtychl)/20 and xtype='General Commission' 
and zactive='1') xamtret
from xyz  group by  xzone,xcus,xorg


