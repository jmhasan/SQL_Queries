
with retail as (
select h.zid,o.xzone,c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid,xconfirmt, 
DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,(d.xqtychl) total
 from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where   CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-30' and
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')<>'Allocated' and o.xstatus='New'

 union all
 select h.zid,o.xzone, c.xgcus,o.xcus,c.xorg,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid, xconfirmt,
 DATEADD(D,0,DATEDIFF(D,0,DATEADD(HOUR,-6,xconfirmt))) todate,d.xqty total
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and d.xid=o.xid
where  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-06-01' and '2021-06-30' and
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')='Allocated' and o.xstatus='New'
)
select zid,a.xzone Zone_Name,a.xcus Dealer_ID,a.xorg Dealer_Name,a.xid Retail_ID,a.xoutletname Retail_Name,xdistrict,xthana,
a.xriid RI_ID,sum(total) total 
 from retail a 
 where a.xgcus  in ('Retailer','Dealer')
group by a.zid,a.xzone,a.xcus,a.xorg,a.xid,a.xoutletname,a.xriid,xdistrict,xthana
having sum(total)>=200