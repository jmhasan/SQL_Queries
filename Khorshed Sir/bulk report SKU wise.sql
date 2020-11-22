select c.xbloodgrp,d.xtypecat,
sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt))='2020-11-21' then xqtychl/20 else 0 end) ondsales,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-11-01' and '2020-11-21' 
 then (xqtychl/20) else 0 end) tillsales,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-10-01' and '2020-10-21'
then  (xqtychl/20) else 0 end) tilldatelastmonth,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2019-10-01' and '2019-10-21'
then  (xqtychl/20) else 0 end) tilldatelastyear

from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
 join cacus c on h.zid=c.zid and h.xcus=c.xcus
where xconfirmt >= '2019-10-01 06:00' and xstatuschl='3-Invoiced' and 
 xsimcardno='Corporate' and d.xtypecat like '%Bulk%' group by c.xbloodgrp,d.xtypecat



