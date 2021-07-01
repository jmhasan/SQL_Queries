select a.xadvnum,xstatusadvmach,a.xqtysms xqtysms,SUM(md.xqtycrn) xqtycrn,SUM(chd.xqtychl)
 from opadvice a left outer join opmachadviced md on a.xadvnum=md.xadvnum left outer join opchallan ch on ch.xmachnum=md.xmachnum
 left outer join opchalland chd on ch.xchlnum=chd.xchlnum
 where a.xstatusadvmach<>'5-Voided' group by a.xadvnum,xstatusadvmach,a.xqtysms 



select xadvnum,xqtysms,xqty,xqtychl,xstatusadvmach from opadvice where xstatusadvmach<>'5-Voided'



select a.xadvnum,xstatusadvmach,a.xqtysms xqtysms,SUM(md.xqtycrn) xqtycrn,SUM(chd.xqtychl)
 from opadvice a left outer join opmachadviced md on a.xadvnum=md.xadvnum left outer join opchallan ch on md.xadvnum=ch.xadvnum 
 left outer join opchalland chd on chd.xchlnum=ch.xchlnum
 where a.xstatusadvmach<>'5-Voided' and ch.xmachnum<>'' group by a.xadvnum,xstatusadvmach,a.xqtysms
