select h.xordernum,h.xdornum,h.xappamt,h.xtotamt,h.xdtwotax,h.xchgtot,d.xqty,d.xqtychl,sum(c.xqtychl)+
coalesce((select SUM(xqtymach) from opmachadviced where xdornum=h.xdornum and xmachnum not in (select xmachnum from opmachadv 
where xstatusmach='4-Challaned')),0)from opdor h join opddt d on h.zid=d.zid and h.xdornum=d.xdornum  join opchalland c on d.zid=c.zid and d.xdornum=c.xdornum 
group by h.xordernum,h.xdornum,h.xappamt,h.xtotamt,h.xdtwotax,h.xchgtot,d.xqty,d.xqtychl
having d.xqtychl<>sum(c.xqtychl)+coalesce((select SUM(xqtymach) from opmachadviced where xdornum=h.xdornum and 
xmachnum not in (select xmachnum from opmachadv where xstatusmach='4-Challaned')),0)