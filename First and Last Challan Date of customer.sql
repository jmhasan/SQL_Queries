select c.xbloodgrp Zone,h.xcus Cus_Code,c.xorg Cus_Name,c.xgcus Cus_Type,min(h.xconfirmt) First_Date,max(h.xconfirmt) Last_Date 
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum 
join cacus c on c.zid=h.zid and c.xcus=h.xcus and h.xstatuschl='3-Invoiced' 
and c.xsimcardno<>'Corporate'  group by c.xbloodgrp,h.xcus,c.xorg,c.xgcus

