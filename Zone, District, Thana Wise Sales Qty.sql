--Without Allocation 
with cte as (
select xzonedel,xyear,xper,xrow,(select Xthana from caoutlet where xid=opchallandt.xrow) xthana,xqtychl from opchallandt 
where xdiv in ('Dhaka','Out Dhaka') and xdatecom>='2021-01-01'),
cte2 as (select (select xdistrict from cadelpoint where xthana=cte.xthana)xdistrict,xzonedel,xthana,xper,xqtychl from cte)
select xzonedel,xdistrict,xthana,
sum(case when xper=1 then xqtychl else 0 end)/20 Jan,
sum(case when xper=2 then xqtychl else 0 end)/20 Feb,
sum(case when xper=3 then xqtychl else 0 end)/20 Mar,
sum(case when xper=4 then xqtychl else 0 end)/20 Apr,
sum(case when xper=5 then xqtychl else 0 end)/20 May,
sum(case when xper=6 then xqtychl else 0 end)/20 Jun,
sum(case when xper=7 then xqtychl else 0 end)/20 Jul from cte2 where cte2.xthana='Bhola'
group by xzonedel,xdistrict,xthana
union all
select xzone,xdistrict,xthana,0 Jan,0 Feb ,0 Mar,0 Apr,0 May,0 Jun,0 Jul from cadelpoint where xthana not in (select xdelpoint from opchallandt where xdatecom>='2021-01-01')


--With Allocation 
with retail as (
select o.xzone,c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xstatus,o.xthana,o.xdistrict,o.xriid,xconfirmt, 
DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,(d.xqtychl) total,
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=1 then d.xqtychl else  0 end "JAN",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2 then d.xqtychl else  0 end  "FEB",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=3 then d.xqtychl else  0 end  "MAR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=4 then d.xqtychl else  0 end  "APR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=5 then d.xqtychl else  0 end  "MAY",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqtychl else  0 end  "JUN",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=7 then d.xqtychl else  0 end "JUL",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=8 then d.xqtychl else  0 end "AUG"
 from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where   CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-01-01' and '2021-08-31' and 
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')<>'Allocated' --and h.xordernum<>''

union all
select o.xzone, c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xstatus,o.xthana,o.xdistrict,o.xriid, xconfirmt,
 DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,d.xqty total,
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=1 then d.xqty else  0 end "JAN",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2 then d.xqty else  0 end  "FEB",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=3 then d.xqty else  0 end  "MAR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=4 then d.xqty else  0 end  "APR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=5 then d.xqty else  0 end  "MAY",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqty else  0 end  "JUN",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=7 then d.xqty else  0 end "JUL",
 case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=8 then d.xqty else  0 end "AUG"
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and d.xid=o.xid
where  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-01-01' and '2021-08-31' and 
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')='Allocated')

select a.xzone Zone_Name,xdistrict,xthana,
sum(JAN) JAN,sum(FEB) FEB, 
sum(MAR) MAR,sum(APR) APR,sum(MAY) MAY,
sum(JUN) JUN,sum(JUL) JUL,sum(AUG) AUG
 from retail a 
group by a.xzone,xdistrict,xthana