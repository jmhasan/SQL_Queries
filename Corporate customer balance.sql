
with xyzzz as (
select c.xbloodgrp xzone,xsub,c.xorg,c.xsp,(select xname from prmst where xemp=c.xsp) RIName,xprime from glheader h join gldetail d 
on h.zid=d.zid and h.xvoucher=d.xvoucher join cacus c on d.xsub=c.xcus where 
h.xdate<='2021-03-31' and xtrngl not in ('OB--','OPN-')  and xpostflag='Posted' and xsimcardno='Corporate')

select xzone,xsub,xorg,xsp,RIName,sum(xprime) balance from xyzzz GROUP by xzone,xsub,xorg,xsp,RIName





--for chaking 
select sum(xprime) from glheaderdetail where xsub='CUS-001060' and xdate<='2021-03-31' and xtrngl not in ('OB--','OPN-')  and xpostflag='Posted'

