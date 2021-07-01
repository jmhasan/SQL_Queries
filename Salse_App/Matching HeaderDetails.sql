
select h.xmachnum,d.xadvnum,(select xtrnnum from opadvice where xadvnum=d.xadvnum) xtrnnum,
d.xcus,dbo.cusname(d.xcus) xorg,h.xdelivery,xsornum,xvehicle,d.xqtycrn,d.xqtymach,h.xstatusmach
 from opmachadv h join  opmachadviced d on h.zid=d.zid and h.xmachnum=d.xmachnum where xadvnum='PCMLDOA-0421-003277'