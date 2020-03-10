with vechilce as (
select v.xvehicle,xlocate,v.xmaxload,v.xregdate,DATEDIFF(month, v.xregdate, GETDATE()) age,r.xsdestin,
year(xtokentime) yr,month(xtokentime) pr,xqtychl,xqty,trkm
 from vmvech v join vmmovereg r on v.zid=r.zid and v.xvehicle=r.xvehicle
where xtokentime>='2019-01-01')
select xvehicle,xlocate,xmaxload,xregdate,age,yr,pr,sum(xqtychl) totchallan,sum(trkm) totrunnigkm,COUNT(*) tottrip,COUNT(distinct xsdestin) totwarehouse,
(select Diesel from vmvechmd where xvmcode=vechilce.xvehicle and xyear=vechilce.yr and xper=vechilce.pr)/65 dieselqty,
(select Diesel from vmvechmd where xvmcode=vechilce.xvehicle and xyear=vechilce.yr and xper=vechilce.pr) Diesel,
(select Maintenance from vmvechmd where xvmcode=vechilce.xvehicle and xyear=vechilce.yr and xper=vechilce.pr) Maintenance,
(select totmt from xyxx where xvehicle=vechilce.xvehicle)mtcout
 from vechilce group by xvehicle,xlocate,xmaxload,xregdate,age,yr,pr
 
 
 with xddd as (
 select xdriver,xvehicle,xname,xjoindate,xstatusemp,xmaxcap,xtokentime,
xsdestin,year(xtokentime) yr,month(xtokentime) pr,
 DATEDIFF(month, xjoindate, GETDATE()) duration_of_employment
 from vmmovereg  join prmst on prmst.zid=vmmovereg.zid and prmst.xemp=vmmovereg.xdriver
 where xvehicle in (select xvehicle from vmvech)
 and xtypev='vehicle' and xtokentime>='2019-01-01' and xsornum  in (select xsornum from opchallan))
  select  xdriver,xvehicle,xname,xjoindate,xstatusemp,xmaxcap,COUNT(*),COUNT(distinct(xsdestin)),duration_of_employment,
  
  yr,case where pr from xddd
  group by   xdriver,xvehicle,xname,xjoindate,xstatusemp,xmaxcap,duration_of_employment,yr,pr
 
 select xemp,xname,xjoindate,xstatusemp,DATEDIFF(month, xjoindate, GETDATE())duration_of_employment 
 from prmst where xemp='100003'
 
 
 select * from vmrepmaintd where xordernum='PCMLVREQ1219-000725'--header
select * from vmfuelitem  --detail
select * from vmrepmaintd --detail


select xvehicle,COUNT(*) totmt into xyxx from vmmanreq where xconfirmt>'2019-01-01' 
group by xvehicle 

select * from xyxx

select ximtmptrn,xref,xvehicle,xwh,xstatustrn from imtemptrn where ximtmptrn='PCMLSR--1019-002287'
select ximtmptrn,xitem,xqtyord,xqtyreq from imtemptdt where ximtmptrn='PCMLDSR-0719-000308'

select xsornum,xvehicle,xtype,xmovetype,xstatusmove,xprime,xglref,xtype,xvhcat,xmaxcap,xqtybagrec,xqtychl,xqty,trkm
 from vmmovereg where  xdate>'2019-10-01' and xqty>0
 
 select h.xvehicle,h.ximtmptrn,xref,xyear,h.xper,xtrnimf,xstatustrn,d.xqtyord,xdocnum,xaccdr 
 from imtemptrn h join imtemptdt d on h.ximtmptrn=d.ximtmptrn where  xdate>'2019-10-01' and xvehicle<>''

select  xvehicle,xlocate,xmaxload,xregdate,DATEDIFF(month, xregdate, GETDATE()) age
from vmvech where xtypev='Vehicle' and xvhcat in ('BULK','COVER VAN','OPEN TRUCK') and xvehicle not in ('Available','Common')



select xyear,xper,case when xper<6 then xyear=xyear else xyear=xyear+1 end,
case when xper<6 then xper=xper+6 else xper=xper-6 end,
xvmcode,sum(coalesce( case when d.xacc='321101020012' then xprime end ,0)) Diesel, 
sum(coalesce( case when d.xacc='321101020015' or d.xacc='321101020014' then xprime end ,0)) Maintenance  
 from glheader h join gldetail d on h.zid=d.zid and h.xvoucher=d.xvoucher
join glmst g on g.zid=d.zid and g.xacc=d.xacc 
where d.xacc  in ('321101020012','321101020015') and xyear>=2018  and xpostflag='Posted'
group by h.xyear,h.xper,xvmcode

select xyear,xper,case when xper<=6 then xyear else xyear+1 end,
case when xper<=6 then xper+6 else xper-6 end
 from 
 update vmvechmd set xyear=case when xper<=6 then xyear else xyear+1 end,
 xper=case when xper<=6 then xper+6 else xper-6 end   

select  * from vmvechmd

