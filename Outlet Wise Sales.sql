with cte as (
select o.zid,o.xzone,o.xcus,o.xrow,o.xid,o.xoutletname,o.xproprietor, o.xmobile, o.xthana,o.xdistrict,o.xriid,
year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xyear,month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xper,
(select xname from prmst where xemp=o.xriid and zid=100000) RINAME,
(select xempnew from opritargetdt where xyear=2021 and xper=02 and xemp=o.xriid) AIID, 
(select xname from prmst where zid=100000 and xemp=(select xempnew from opritargetdt where xyear=2020 and xper=12 and xemp=o.xriid)) AINAME, 
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2020 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=11 then d.xqtychl else 0 end November_2020,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2020 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=12 then d.xqtychl else 0 end December_2020,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=01 then d.xqtychl else 0 end  January_2021,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=02 then d.xqtychl else 0 end  February_2021 from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-11-01' and '2021-02-28'  and  o.xdiv in ('Dhaka','Out Dhaka')
and coalesce(h.xdornum,'')<>'Allocated'
--and c.xbloodgrp in ('FARIDPUR','KUSHTIA','DHAKA NORTH','DHAKA MIDDLE','MYMENSINGH','NARAYANGONJ','BARISAL','KUSHTIA','FARIDPUR','JESSORE','GAZIPUR','KHULNA')
 --group by c.xbloodgrp,c.xcus,c.xorg,o.xrow,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid
 union all
 select o.zid,o.xzone,o.xcus,o.xrow,o.xid,o.xoutletname,o.xproprietor, o.xmobile,o.xthana,o.xdistrict,o.xriid,
 year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xyear,month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) xper,
(select xname from prmst where xemp=o.xriid and zid=100000) RINAME,(select xempnew from opritargetdt where xyear=2020 and xper=12 and xemp=o.xriid) AIID, 
(select xname from prmst where zid=100000 and xemp=(select xempnew from opritargetdt where xyear=2021 and xper=02 and xemp=o.xriid)) AINAME, 
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2020 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=11 then d.xqty else 0 end November_2020,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2020 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=12 then d.xqty else 0 end December_2020,
case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=01 then d.xqty else 0 end  January_2021,
 case when year(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2021 and month(CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=02 then d.xqty else 0 end  February_2021 from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum join caoutlet o on h.zid=o.zid and d.xid=o.xid
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-11-01' and '2021-02-28' and  o.xdiv in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')='Allocated'
--and c.xbloodgrp in ('FARIDPUR','KUSHTIA','DHAKA NORTH','DHAKA MIDDLE','MYMENSINGH','NARAYANGONJ','BARISAL','KUSHTIA','FARIDPUR','JESSORE','GAZIPUR','KHULNA')
 --group by c.xbloodgrp,c.xcus,c.xorg,o.xrow,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid
)
select cte.xzone,cte.xcus,c.xorg,xrow,cte.xid,xoutletname,xproprietor,cte.xmobile,xthana,cte.xdistrict,xriid,RINAME,AIID,AINAME,
 sum(November_2020) November_2020, sum(December_2020) December_2020, sum (January_2021) January_2021, sum (February_2021) February_2021  from cte
join cacus c on c.xcus=cte.xcus 
group by cte.xzone,cte.xcus,c.xorg,xrow,cte.xid,xoutletname,xproprietor,cte.xmobile,xthana,cte.xdistrict,xriid,RINAME,AIID,AINAME