select c.xcus,c.xorg,c.xbloodgrp,sum(0-xprime) xprime from glheaderdetail g 
join cacus c on g.zid=c.zid and g.xsub=c.xcus  where g.xdate between '2020-11-01' and '2020-11-30' 
and g.xprime<0 and c.xsimcardno<>'Bag Plant' and 
xtrngl in ('CHQ-','BR--','JVNA','CR--','CRF-','JVI-','JV--') and xpostflag='Posted'

group by c.xcus,c.xorg,c.xbloodgrp