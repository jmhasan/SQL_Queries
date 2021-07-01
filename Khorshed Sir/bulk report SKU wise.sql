  
select c.xbloodgrp Zone,d.xtypecat Item_Type,
<<<<<<< HEAD
sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt))='2021-06-29' then xqtychl/20 else 0 end) ondsales,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-29' 
 then (xqtychl/20) else 0 end) tillsales,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-05-01' and '2021-05-29'
then  (xqtychl/20) else 0 end) tilldatelastmonth,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-06-01' and '2020-06-29' 
=======
sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt))='2021-06-18' then xqtychl/20 else 0 end) ondsales,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-18' 
 then (xqtychl/20) else 0 end) tillsales,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-05-01' and '2021-05-18'
then  (xqtychl/20) else 0 end) tilldatelastmonth,

sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-06-01' and '2020-06-18' 
>>>>>>> 4641648a8ef7c75b29ac42b9a3a7a5cd299a8b27
then  (xqtychl/20) else 0 end) tilldatelastyear

from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
 join cacus c on h.zid=c.zid and h.xcus=c.xcus
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) >= '2020-06-01' and xstatuschl='3-Invoiced' and 
 xsimcardno='Corporate' and d.xtypecat like '%Bulk%' group by c.xbloodgrp,d.xtypecat
