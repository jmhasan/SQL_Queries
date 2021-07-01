with retail as (
select o.xzone,c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xstatus,o.xthana,o.xdistrict,o.xriid,xconfirmt, 
DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,(d.xqtychl) total,
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=09 then d.xqtychl else  0 end "SEP",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=10 then d.xqtychl else  0 end "OCT",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=11 then d.xqtychl else  0 end "NOV",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=12 then d.xqtychl else  0 end "DEC",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=1 then d.xqtychl else  0 end "JAN",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2 then d.xqtychl else  0 end  "FEB",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=3 then d.xqtychl else  0 end  "MAR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=4 then d.xqtychl else  0 end  "APR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=5 then d.xqtychl else  0 end  "MAY",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqtychl else  0 end  "JUN"
 from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where   CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-09-01' and '2021-06-29' and
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')<>'Allocated' --and h.xordernum<>''
--DATEADD(mm, DATEDIFF(mm, 0, GETDATE()) - 10, 0) and  DATEADD(D,-1,DATEDIFF(D,0,GETDATE())) and
--c.xcus='CUS-000041'
--and CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-09'
-- CONVERT(date,(GETDATE()-1))--DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0)
--group by c.xbloodgrp,c.xcus,c.xorg,o.xrow,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid
 union all
 select o.xzone, c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xstatus,o.xthana,o.xdistrict,o.xriid, xconfirmt,
 DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,d.xqty total,
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=09 then d.xqty else  0 end "SEP",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=10 then d.xqty else  0 end "OCT",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=11 then d.xqty else  0 end "NOV",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=12 then d.xqty else  0 end "DEC",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=1 then d.xqty else  0 end "JAN",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2 then d.xqty else  0 end  "FEB",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=3 then d.xqty else  0 end  "MAR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=4 then d.xqty else  0 end  "APR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=5 then d.xqty else  0 end  "MAY",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqty else  0 end  "JUN"
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and d.xid=o.xid
where  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-09-01' and '2021-06-29' and 
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')='Allocated' --and h.xordernum<>''
--and c.xgcus='Contractor'
--and CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-09'
)

select a.xzone Zone_Name,a.xcus Dealer_ID,a.xorg Dealer_Name,xgcus,a.xid Retail_ID,a.xoutletname Retail_Name,a.xstatus,xdistrict,xthana,
a.xriid RI_ID,(select xname from prmst where xemp=a.xriid) RI_Name,
(select xtsoid from cacushrc where xriid=a.xriid) AI_ID,(select xname from prmst where xemp=(select xtsoid from cacushrc where xriid=a.xriid)) AI_Name,
(select xziid from cacushrc where xriid=a.xriid) ZI_ID,--(select xname from prmst where xemp=(select xziid from cacushrc where xriid=a.xriid)) ZI_Name,
(select xname from prmst where xemp=(select xziid from cazone where xzone=a.xzone)) ZI_Name1,
(select Criteria_3 from retailtargetraw where xid=a.xid) Slab_Target,
(select julytarget from retailtargetraw where xid=a.xid) julytarget,
sum(SEP) SEP,sum(OCT) OCT,sum(NOV) NOV, case when sum(SEP) +sum(OCT)+sum(NOV)>=600 then 'Yes' else 'No' end as Duranto_offer,
sum(DEC) DEC,sum(JAN) JAN,sum(FEB) FEB, case when sum(JAN) +sum(FEB)+sum(DEC)>=600 then 'Yes' else 'No' end as Bijoy_offer,
sum(MAR) MAR,sum(APR) APR,sum(MAY) MAY, case when sum(MAR) +sum(APR)+sum(MAY)>=600 then 'Yes' else 'No' end as MAR_MAY,
sum(JUN) JUN,
case when (select Criteria_3 from retailtargetraw where xid=a.xid)>0 and sum(JUN) >0 and (sum(JUN)*100)/(select Criteria_3 from retailtargetraw where xid=a.xid)<40 then 'Yes' else 'No' end as JUN_bellow40,
sum(total) total
--(select Criteria_3 from retailtargetraw where xid=a.xid)/
--(select count(*) from cadate where xyear=year(getdate()-1)and xper=month(getdate()-1)
--and xname=FORMAT(DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,GETDATE()-1))), 'dddd'))*1 as tilldatetarget_as_per_routp
 from retail a where a.xgcus  in ('Retailer','Dealer')
--join routep b  on a.xriid=b.xriid and a.xid=b.xid --where xname= FORMAT(DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,GETDATE()-1))), 'ddd')  -- where xid='MNS-00042'
group by a.xzone,a.xcus,a.xorg,a.xgcus,a.xid,a.xoutletname,a.xstatus,a.xriid,xdistrict,xthana