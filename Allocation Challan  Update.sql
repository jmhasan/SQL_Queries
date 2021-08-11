select * from opchallan where CONVERT(date,DATEADD(HOUR,-6,xconfirmt))>='2020-12-01'  and xshipcode='Vessel' 
and xchlnum in (select xchlnum from opchallanalc) and coalesce(xdornum,'')<>'Allocated'
--update opchallan set xdornum='Allocated' where CONVERT(date,DATEADD(HOUR,-6,xconfirmt))>='2020-12-01'  and xshipcode='Vessel' 
--and xchlnum in (select xchlnum from opchallanalc) and coalesce(xdornum,'')<>'Allocated'


-- Pending Challan Allocation List 
select h.xcus,c.xorg,c.xbloodgrp,c.xsimcardno,h.xdelivery,h.xordernum,(select xoutletname from caoutlet where xid=h.xordernum) xid,h.xchlnum, d.xqtychl from opchallan h join cacus c on h.zid=c.zid and h.xcus=c.xcus join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum where 
CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-07-01' and  '2021-07-31' and xshipcode='Vessel' 
and h.xchlnum not in (select xchlnum from opchallanalc)  and c.xsimcardno in ('Dhaka','Out Dhaka') order by d.xqtychl desc 