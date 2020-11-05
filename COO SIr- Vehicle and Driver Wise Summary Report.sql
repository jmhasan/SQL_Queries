--Vehicle Wise 
with cte as (
select v.xsornum,v.xvehicle,v.xdriver,d.xqtychl,v.xtype,coalesce(v.trkm,0)trkm,h.xconfirmt,v.xmovetype,v.xstatusmove,h.xwh,v.xmaxcap,
coalesce((select sum(xqtyord) from vmrepmaint where xsornum=v.xsornum and  xstatusord='Issue Created' and xvehicle=v.xvehicle ),0) Fuel_issues
--coalesce((select sum(xrate)/65   from vmmoveregrtrev where xsornum=v.xsornum and xvmcode='Diesel from Outside'),0) fuel_outside
  from vmmovereg v join opchallan h 
on v.zid=h.zid and v.xsornum=h.xsornum join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
where h.xconfirmt between '2020-04-01 06:00:00' and '2020-04-23 06:00:00' and xstatuschl='3-Invoiced' 
and v.xtype='DO Delivery' )

select vmvech.xvehicle,vmvech.xmaxload,COUNT(distinct xsornum) no_of_trip,COUNT(*) No_of_droppoint,
 SUM(xqtychl)/20 xqtychl,SUM(trkm) trkm,sum(case when trkm=0 then 1 else 0 end ) Trkm_notfound,
  SUM(Fuel_issues)  Fuel_issues ,sum(case when Fuel_issues=0 then 1 else 0 end ) Fuel_notfound
--select cte.xvehicle,cte.xmaxcap
from vmvech left outer join  cte  on vmvech.xvehicle=cte.xvehicle where vmvech.zactive=1 and vmvech.xtypev='Vehicle'
 group by vmvech.xvehicle,vmvech.xmaxload

--Driver Wise

with cte as (
select v.xsornum,v.xvehicle,v.xdriver,d.xqtychl,v.xtype,coalesce(v.trkm,0)trkm,h.xconfirmt,v.xmovetype,v.xstatusmove,h.xwh,v.xmaxcap,
coalesce((select sum(xqtyord) from vmrepmaint where xsornum=v.xsornum and  xstatusord='Issue Created' and xvehicle=v.xvehicle ),0) Fuel_issues
--coalesce((select sum(xrate)/65   from vmmoveregrtrev where xsornum=v.xsornum and xvmcode='Diesel from Outside'),0) fuel_outside
  from vmmovereg v join opchallan h 
on v.zid=h.zid and v.xsornum=h.xsornum join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
where h.xconfirmt between '2020-04-01 06:00:00' and '2020-04-23 06:00:00' and xstatuschl='3-Invoiced' 
and v.xtype='DO Delivery' )

select xdriver,(select xname from prmst where xemp=cte.xdriver),COUNT(distinct xsornum) no_of_trip,COUNT(*) No_of_droppoint,
 SUM(xqtychl)/20 xqtychl,SUM(trkm) trkm,sum(case when trkm=0 then 1 else 0 end ) Trkm_notfound,
  SUM(Fuel_issues)  Fuel_issues ,sum(case when Fuel_issues=0 then 1 else 0 end ) Fuel_notfound
--select cte.xvehicle,cte.xmaxcap
from cte   group by xdriver
