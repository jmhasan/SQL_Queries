with retail as (
select o.xzone,o.xcus,c.xorg,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid,xconfirmt, DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,
(d.xqtychl) total,
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 6, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 6, 0)+day(GETDATE()-2) then d.xqtychl else  0 end "before_06_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 5, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 5, 0)+day(GETDATE()-2) then d.xqtychl else  0 end "before_05_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0)+day(GETDATE()-2) then d.xqtychl else  0 end "before_04_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0)+day(GETDATE()-2) then d.xqtychl else  0 end "before_03_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0)+day(GETDATE()-2) then d.xqtychl else  0 end "before_02_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0)+day(GETDATE()-2) then d.xqtychl else  0 end "before_01_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 0, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 0, 0)+day(GETDATE()-2) then d.xqtychl else  0 end "Current_month_Sales"
 from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where   CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 6, 0) and  DATEADD(D,-1,DATEDIFF(D,0,GETDATE())) and  c.xsimcardno in ('Dhaka','Out Dhaka') 
and coalesce(h.xdornum,'')<>'Allocated' and h.xordernum<>''
-- CONVERT(date,(GETDATE()-1))--DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)
--group by c.xbloodgrp,c.xcus,c.xorg,o.xrow,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid
 union all
 select o.xzone,o.xcus,c.xorg,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid, xconfirmt,DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,
d.xqty total,
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 6, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 6, 0)+day(GETDATE()-2) then d.xqty else  0 end "before_06_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 5, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 5, 0)+day(GETDATE()-2) then d.xqty else  0 end "before_05_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 4, 0)+day(GETDATE()-2) then d.xqty else  0 end "before_04_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 3, 0)+day(GETDATE()-2) then d.xqty else  0 end "before_03_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 2, 0)+day(GETDATE()-2) then d.xqty else  0 end "before_02_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 1, 0)+day(GETDATE()-2) then d.xqty else  0 end "before_01_month_Sales",
case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 0, 0) and  
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 0, 0)+day(GETDATE()-2) then d.xqty else  0 end "Current_month_Sales"
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and d.xid=o.xid
where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between
DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 6, 0) and  DATEADD(D,-1,DATEDIFF(D,0,GETDATE())) and  c.xsimcardno in ('Dhaka','Out Dhaka') 
and coalesce(h.xdornum,'')='Allocated' and h.xordernum<>'')

select a.xzone,a.xcus,a.xorg,a.xid,a.xoutletname,a.xdistrict,a.xthana,a.xriid,FORMAT(DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,GETDATE()-1))), 'ddd') Day_Name,
sum(before_06_month_Sales) before_06_month_Sales,sum(before_05_month_Sales) before_05_month_Sales,
sum(before_04_month_Sales) before_04_month_Sales,sum(before_03_month_Sales) before_03_month_Sales,sum(before_02_month_Sales) before_02_month_Sales,
sum(before_01_month_Sales) before_01_month_Sales,
(sum(before_06_month_Sales) +sum(before_05_month_Sales) +sum(before_04_month_Sales) +sum(before_03_month_Sales) +sum(before_02_month_Sales) +
sum(before_01_month_Sales))/6 Last_sixmonth_avg_sales,sum(Current_month_Sales) Till_Achivement,
 (select count(*) from cadate where xyear=year(getdate()-1)and xper=month(getdate()-1)
and xname=FORMAT(DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,GETDATE()-1))), 'dddd')),
(select Criteria_3 from retailtargetraw where xid=a.xid) Targets,
((select Criteria_3 from retailtargetraw where xid=a.xid) /day(eomonth (GETDATE()-1))*day(GETDATE()-1)) till_date_target,
(sum(Current_month_Sales)*100)/((select Criteria_3 from retailtargetraw where xid=a.xid) /day(eomonth (GETDATE()-1))*day(GETDATE()-1)) till_date_achv_per

--(select Criteria_3 from retailtargetraw where xid=a.xid)/
--(select count(*) from cadate where xyear=year(getdate()-1)and xper=month(getdate()-1)
--and xname=FORMAT(DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,GETDATE()-1))), 'dddd'))*1 as tilldatetarget_as_per_routp
 from retail a 
join routep b  on a.xriid=b.xriid and a.xid=b.xid where xname= FORMAT(DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,GETDATE()-1))), 'ddd')  -- where xid='MNS-00042'
group by a.xzone,a.xcus,a.xorg,a.xid,a.xoutletname,a.xdistrict,a.xthana,a.xriid




