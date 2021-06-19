--Retail Wise Gift List
with cte as (
 select  o.xzone,h.xcus,(select xorg from cacus where xcus=h.xcus) xorg, h.xconfirmt, h.xchlnum,h.xdelivery,
 CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt)) xdate ,h.xcuspo,
 h.xordernum xid,o.xoutletname,o.xproprietor,h.xsitemobile,h.xdelsite, h.xteam xteams,
d.xqtychl  from   opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum 
 join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where o.xcus<>'NA' and CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-04-05' and '2021-05-27'
   and  h.xdiv in ('Dhaka','Out Dhaka')  and h.xcuspo<>'' )
select  xzone,xcus,xorg, xconfirmt,  xdate ,xcuspo,
xid,xoutletname,xproprietor,xsitemobile,xdelsite,xchlnum,xdelivery,sum(xqtychl)
from cte 
group by  xzone,xcus,xorg ,xconfirmt ,xdate ,xcuspo,
xid,xoutletname,xproprietor,xsitemobile,xdelsite,xchlnum,xdelivery


