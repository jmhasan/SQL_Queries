with cte as (
select o.zid,o.xzone,o.xcus,o.xrow,o.xid,o.xoutletname,o.xproprietor, o.xmobile, o.xthana,o.xdistrict,o.xriid,
year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xyear,month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xper,
(select xname from prmst where xemp=o.xriid and zid=100000) RINAME,
(select xempnew from opritargetdt where xyear=2021 and xper=07 and xemp=o.xriid) AIID, 
(select xname from prmst where zid=100000 and xemp=(select xempnew from opritargetdt where xyear=2021 and xper=07 and xemp=o.xriid)) AINAME, 
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=01 then d.xqtychl else 0 end jan_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=02 then d.xqtychl else 0 end feb_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=03 then d.xqtychl else 0 end  mar_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=04 then d.xqtychl else 0 end  apr_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=05 then d.xqtychl else 0 end  may_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=06 then d.xqtychl else 0 end  jun_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=07 then d.xqtychl else 0 end  jul_21
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-01-01' and '2021-07-25'  and  o.xdiv in ('Dhaka','Out Dhaka')
and coalesce(h.xdornum,'')<>'Allocated'
--and c.xbloodgrp in ('FARIDPUR','KUSHTIA','DHAKA NORTH','DHAKA MIDDLE','MYMENSINGH','NARAYANGONJ','BARISAL','KUSHTIA','FARIDPUR','JESSORE','GAZIPUR','KHULNA')
 --group by c.xbloodgrp,c.xcus,c.xorg,o.xrow,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid
 union all
 select o.zid,o.xzone,o.xcus,o.xrow,o.xid,o.xoutletname,o.xproprietor, o.xmobile,o.xthana,o.xdistrict,o.xriid,
 year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xyear,month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xper,
(select xname from prmst where xemp=o.xriid and zid=100000) RINAME,(select xempnew from opritargetdt where xyear=2021 and xper=07 and xemp=o.xriid) AIID, 
(select xname from prmst where zid=100000 and xemp=(select xempnew from opritargetdt where xyear=2021 and xper=07 and xemp=o.xriid)) AINAME, 
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=01 then d.xqty else 0 end jan_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=02 then d.xqty else 0 end feb_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=03 then d.xqty else 0 end  mar_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=04 then d.xqty else 0 end  apr_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=05 then d.xqty else 0 end  may_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=06 then d.xqty else 0 end  jun_21,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=07 then d.xqty else 0 end  jul_21
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum join caoutlet o on h.zid=o.zid and d.xid=o.xid
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between  '2021-01-01' and '2021-07-25' and  o.xdiv in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')='Allocated'
--and c.xbloodgrp in ('FARIDPUR','KUSHTIA','DHAKA NORTH','DHAKA MIDDLE','MYMENSINGH','NARAYANGONJ','BARISAL','KUSHTIA','FARIDPUR','JESSORE','GAZIPUR','KHULNA')
 --group by c.xbloodgrp,c.xcus,c.xorg,o.xrow,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid
)
select cte.xzone,cte.xcus,c.xorg,xrow,cte.xid,xoutletname,xproprietor,cte.xmobile,xthana,cte.xdistrict,xriid,RINAME,AIID,AINAME,
 sum(jan_21) jan_21, sum(feb_21) feb_21, sum (mar_21) mar_21, sum (apr_21) apr_21,sum (may_21) may_21,sum (jun_21) jun_21,sum (jul_21) jul_21  from cte
join cacus c on c.xcus=cte.xcus 
group by cte.xzone,cte.xcus,c.xorg,xrow,cte.xid,xoutletname,xproprietor,cte.xmobile,xthana,cte.xdistrict,xriid,RINAME,AIID,AINAME