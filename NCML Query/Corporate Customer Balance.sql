
with xyzzz as (
select c.xbloodgrp xzone,xsub,c.xorg,c.xsp,(select xname from prmst where xemp=c.xsp) RIName,xprime from glheader h join gldetail d 
on h.zid=d.zid and h.xvoucher=d.xvoucher join cacus c on d.xsub=c.xcus where 
h.xdate<='2021-06-30' and xtrngl not in ('OB--','OPN-')  and xpostflag='Posted' and xsimcardno='Corporate')

select xzone,xsub,xorg,xsp,RIName,sum(xprime) balance from xyzzz GROUP by xzone,xsub,xorg,xsp,RIName