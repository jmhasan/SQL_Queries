select dbo.cusname(h.xcus) Cus_name, dbo.cuszone(h.xcus) Zone,h.xdelivery  carrying_type,h.xchlnum,
(REPLACE(REPLACE(a.xdelsite, '''', ''), '"', '')) "Address",
h.xconfirmt "Date",h.xsornum MoveNo,a.xsp,
h.xchlnum ChallanNo,d.xqtychl CHLQTY,h.xwh Warehouse,h.xadvnum "Advice/CallNo"
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join opadvice a on a.zid=h.zid and a.xadvnum=h.xadvnum where h.xadvnum<>'' and xstatuschl='3-Invoiced' and
 h.xconfirmt between '2019-12-01 06:00:00.000' and  '2019-12-31 06:00:00.000' 
and xstatuschl='3-Invoiced' and dbo.cusdiv(h.xcus)<>'Corporate' and h.xadvnum<>''
order by h.xchlnum
