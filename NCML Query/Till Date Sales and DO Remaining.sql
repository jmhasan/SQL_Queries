--NCML  Zone Wise Till date Sales & DO Remaining  
DECLARE @fxdate AS date
DECLARE @txdate AS date
SET @fxdate = '2021-08-01'
SET @txdate = '2021-08-04';

with opsalesdoncml  (Zone,tillsales,ondsales,DORemaining) as (
select c.xbloodgrp,sum(xqtychl/20) tillsales,
sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt))=@txdate 
then xqtychl/20 else 0 end) ondsales,0 DORemaining from 
opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum  join cacus c on c.zid=h.zid and c.xcus=h.xcus
where xstatuschl='3-Invoiced' and 
 CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between @fxdate and @txdate --and h.xcus='CUS-000041'
group by c.xbloodgrp 
union all 
select c.xbloodgrp,0 tillsales,0 ondsales,sum(xqty-xqtychl)/20 DORemaining from opdor h join opddt d on h.zid=d.zid and h.xdornum=d.xdornum 
join cacus c on c.zid=h.zid and c.xcus=h.xcus
where xstatusdor<>'C-Cancelled' and h.xdate<=@txdate  group by c.xbloodgrp having sum(d.xqty-d.xqtychl)>0)

select Zone,sum(tillsales) tillsales,sum(ondsales) ondsales,sum(DORemaining) DORemaining from opsalesdoncml group by Zone

