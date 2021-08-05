select c.xbloodgrp Zone,h.xchlnum,h.xcus,c.xorg,h.xvehicle,h.xdelivery,d.xqtychl,xcuspo,xteam,
(select xname from prmst where xemp=h.xteam and zid=h.zid) RI_Name from opchallan h join opchalland d on h.xchlnum=d.xchlnum and h.zid=d.zid 
join cacus c on h.zid=c.zid and h.xcus=c.xcus 
where  
 c.xsimcardno<>'Corporate' and xcuspo='Belal & Brothers' order by xconfirmt desc 

