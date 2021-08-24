with cte as (
 select h.zid,   xconfirmt   xdatecom,h.xdelivery,h.xwh,  h.xdelpoint,c.xgcus,   
 (select xdistrict from cadelpoint where  zid=h.zid and xthana=h.xdelpoint) xdistrict, h.xsornum, h.xvehicle,h.xtypeloc,     
 h.xconfirmt,h.xchlnum,c.xbloodgrp,h.xcus,c.xorg ,h.xordernum,h.xsitemobile,h.xdelsite, o.xqtydel,o.xid,o.xoutletname,o.xproprietor,o.xaddress, 
 h.xteam,coalesce((select xname from prmst where xemp=h.xteam and zid=h.zid),'NA') RINAME,                        
 coalesce((select max(xtsoid) from cacushrc where xriid=h.xteam),'NA') xtsoid ,  coalesce((select  xname from prmst where zid=h.zid     
 and  xemp=coalesce((select max(xtsoid) from cacushrc where xriid=o.xriid),'')),'NA') AINAME ,              
 d.xqtychl,d.xrate,d.xchgdel,d.xbonqty,CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt)) xdate from   opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum 
 join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where o.xcus<>'NA' and CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-07-01' and '2021-08-23'  and  h.xdiv in ('Dhaka','Out Dhaka')
and coalesce(h.xdornum,'')<>'Allocated'
 union all
 select h.zid, xconfirmt  xdatecom,h.xdelivery,h.xwh,  h.xdelpoint,c.xgcus,   
 (select xdistrict from cadelpoint where  zid=h.zid and xthana=h.xdelpoint) xdistrict, h.xsornum, h.xvehicle,h.xtypeloc,     
 h.xconfirmt,h.xchlnum,c.xbloodgrp,h.xcus,c.xorg ,h.xordernum,h.xsitemobile,h.xdelsite,  o.xqtydel,o.xid,o.xoutletname,o.xproprietor,o.xaddress, 
 h.xteam,coalesce((select xname from prmst where xemp=h.xteam and zid=h.zid),'NA') RINAME,                        
 coalesce((select max(xtsoid) from cacushrc where xriid=h.xteam),'NA') xtsoid ,  coalesce((select  xname from prmst where zid=h.zid     
 and  xemp=coalesce((select max(xtsoid) from cacushrc where xriid=o.xriid),'')),'NA') AINAME ,              
 d.xqty xqtychl,0 xrate,0 xchgdel,0 xbonqty,CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt)) xdate from     opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum             
 join cacus c on c.zid=h.zid and c.xcus=h.xcus join caoutlet o  on h.zid=o.zid and h.xordernum=o.xid where o.xcus<>'NA' and  
CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-07-01' and '2021-08-23'   and  h.xdiv in ('Dhaka','Out Dhaka') 
and coalesce(h.xdornum,'')='Allocated')
select xbloodgrp,xcus,xorg,xid,xoutletname, 
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-07-01' and '2020-07-31' then xqtychl else 0 end)/20 Jul_20,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-08-01' and '2020-08-31' then xqtychl else 0 end)/20 Aug_20,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-09-01' and '2020-09-30' then xqtychl else 0 end)/20 Sep_20,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-10-01' and '2020-10-31' then xqtychl else 0 end)/20 Oct_20,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-11-01' and '2020-11-30' then xqtychl else 0 end)/20 Nov_20,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-12-01' and '2020-12-31' then xqtychl else 0 end)/20 DEC_20,

sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-01-01' and '2021-01-31' then xqtychl else 0 end)/20 Jan_21,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-02-01' and '2021-02-28' then xqtychl else 0 end)/20 Feb_21,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-03-01' and '2021-03-31' then xqtychl else 0 end)/20 Mar_21,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-04-01' and '2021-04-30' then xqtychl else 0 end)/20 Apr_21,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-05-01' and '2021-05-31' then xqtychl else 0 end)/20 May_21,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-30' then xqtychl else 0 end)/20 Jun_21,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-07-01' and '2021-07-31' then xqtychl else 0 end)/20 Jul_21,
sum(case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-08-01' and '2021-08-23' then xqtychl else 0 end)/20 Aug_21

 from cte group by  xbloodgrp,xcus,xorg,xid,xoutletname