select h.xmachnum,d.xdornum,d.xqtymach,d.xrate,d.xchgdel,d.xchgtot,d.xdtwotax,d.xlineamt,h.xstatusmach,
(select xchlnum from opchallan where zid=h.zid and xmachnum=h.xmachnum) xchlnum,
(select xstatuschl from opchallan where zid=h.zid and xmachnum=h.xmachnum) xstatuschl
from opmachadv h join opmachadviced d on h.zid=d.zid and h.xmachnum=d.xmachnum
where h.xstatusmach<>'4-Challaned' and  d.xcus='CUS-000131'