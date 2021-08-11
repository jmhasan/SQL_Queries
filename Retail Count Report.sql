--With Allocation 
with retail as (
select o.xzone,c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xstatus,o.xthana,o.xdistrict,o.xriid,xconfirmt, 
DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,(d.xqtychl) total,

case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqtychl else  0 end  "JUN"
 from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where   CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-30' and 
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')<>'Allocated' --and h.xordernum<>''

union all
select o.xzone, c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xstatus,o.xthana,o.xdistrict,o.xriid, xconfirmt,
 DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,d.xqty total,

case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqty else  0 end  "JUN"
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and d.xid=o.xid
where  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-30' and 
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')='Allocated')

select a.xzone Zone_Name,xcus,xorg,sum(JUN) JUN,count(distinct xid)
 from retail a 
group by a.xzone,xcus,xorg