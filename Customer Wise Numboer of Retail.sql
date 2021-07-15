 select YEAR(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))) AS xyear, month(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))) xper,c.xbloodgrp,h.xcus,c.xorg,count(distinct h.xordernum) no_of_retail from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  where   CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt)) between '2020-09-01' and '2021-06-30' and
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')<>'Allocated'
group by YEAR(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))) , month(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))) ,c.xbloodgrp,h.xcus,c.xorg
union all 
select YEAR(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))) AS xyear, month(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))) xper,c.xbloodgrp,h.xcus,c.xorg,count(distinct d.xid) no_of_retail
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  
where  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-09-01' and '2021-06-30' and
c.xsimcardno in ('Dhaka','Out Dhaka') and coalesce(h.xdornum,'')='Allocated'
group by YEAR(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))), month(CONVERT(date,DATEADD(HOUR,-6,h.xconfirmt))),c.xbloodgrp,h.xcus,c.xorg