select h.xordernum,h.xdornum,h.xappamt,h.xtotamt,h.xdtwotax,h.xchgtot,d.xqty,d.xqtychl,sum(c.xqtychl)+
coalesce((select SUM(xqtymach) from opmachadviced where xdornum=h.xdornum and xmachnum not in (select xmachnum from opmachadv 
where xstatusmach='4-Challaned')),0)from opdor h join opddt d on h.zid=d.zid and h.xdornum=d.xdornum  join opchalland c on d.zid=c.zid and d.xdornum=c.xdornum 
group by h.xordernum,h.xdornum,h.xappamt,h.xtotamt,h.xdtwotax,h.xchgtot,d.xqty,d.xqtychl
having d.xqtychl<>sum(c.xqtychl)+coalesce((select SUM(xqtymach) from opmachadviced where xdornum=h.xdornum and 
xmachnum not in (select xmachnum from opmachadv where xstatusmach='4-Challaned')),0)


select xdornum,xqty,xqtychl from opddt where xdornum='PCMLDO--0120-002496'
select  xstatusdor from opdor where xdornum='PCMLDO--1219-002309'

select SUM(xqtychl) from opchalland where xdornum='PCMLDO--0120-002496' and xchlnum not in (select xchlnum from opchallan where 
xmachnum<>'')

select SUM(xqtychl) from opchalland where xdornum='PCMLDO--0120-002496' and xchlnum not in (select xchlnum from opchallan where 
xmachnum='') 

select xmachnum,SUM(xqtymach) from opmachadviced where xdornum='PCMLDO--0120-002496' 
and xmachnum in (select xmachnum from opmachadv where xstatusmach<>'4-Challaned')
group by xmachnum

select xdornum,count(*) from opdot group by xdornum having  count(*)>2

select xstatuscus,COUNT(*) from opdot group by xstatuscus


select xcus,xtrnnum,xdornum,xfwh,xtwh,xcode,xtypecat,xqty,xqtyord,xstatuscus from opdot where xstatuscus='Checked'
 and xtrnnum  not in (select xtrnnum from opchalland where xtrnnum<>'')
 
select * from opdot where zid=100000 and xdornum='PCMLDO--0119-001563' and xfwh='FINISHED GOODS' 
and xtwh='Pagla Ghat' and xstatuscus not in ('5-Challaned','5-Transferred')


select xadvnum,xstatusadvmach,xqtysms,xqty from opadvice where xadvnum='PCMLDOA-1019-002061'

select * from opmachadviced where xadvnum='PCMLDOA-1019-002061'

select * from 

