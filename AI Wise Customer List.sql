
with abc as (
select xsimcardno,xbloodgrp,r.xcus,c.xorg,xriid,(select xtsoid from cacushrc where xriid=r.xriid) xtsoid
 from cacusrii r join cacus c on  r.zid=c.zid and r.xcus=c.xcus where r.xcus not like 'N%'
and xstatuscus='1-Open' and (select xtsoid from cacushrc where xriid=r.xriid) is not null 
)
select xsimcardno,xbloodgrp ,xcus,xorg,xtsoid,dbo.empname(xtsoid),COUNT(*)  from abc 
group by  xsimcardno,xbloodgrp,xtsoid,xcus,xorg

