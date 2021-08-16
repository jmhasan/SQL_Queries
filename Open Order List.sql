
select c.xbloodgrp Zone,h.xcus Cus_Code,c.xorg Cus_Name,sum(d.xqtyord) qty,sum(xlineamt) amount from opord h join opodt d on h.zid=d.zid and h.xordernum=d.xordernum join cacus c on h.zid=c.zid and h.xcus=c.xcus where 
xstatusord='1-Open' and h.xdate='2021-08-16' and c.xbloodgrp='RANGPUR'
group by c.xbloodgrp,h.xcus,c.xorg
