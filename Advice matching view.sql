select a.xdate,a.xadvnum,a.xstatusadvmach,sum(a.xqtysms) advqty,sum(xqtymach) matchqty,SUM(xqtycut) voidqty,sum(a.xqtysms)-sum(xqtymach)
 from opadvice a left outer join opmachadviced md on  a.xadvnum=md.xadvnum join opmachadv mh on md.xmachnum=mh.xmachnum
where a.xstatusadvmach='4-Mached' group by a.xdate,a.xadvnum,a.xstatusadvmach  having (sum(a.xqtysms)-sum(xqtymach)) > 1

select * from opadvice where xadvnum='PCMLDOA-0819-000033'


select a.xadvnum,a.xstatusadvmach,mh.xstatusmach,sum(a.xqtysms),sum(xqtymach),SUM(chd.xqtychl),SUM(xqtycut) from opadvice a 
left outer join opmachadviced md on  a.xadvnum=md.xadvnum join opmachadv mh on md.xmachnum=mh.xmachnum
join opchallan ch on mh.xmachnum=ch.xmachnum join opchalland chd on ch.xchlnum=chd.xchlnum
group by a.xadvnum,a.xstatusadvmach,mh.xstatusmach

select * from macview
select xadvnum,xcus,xqtysms,xqty,xstatusadvmach,xqtychl,xqtycrn,xqtymach from opadvmacview where xstatusadvmach='4-Mached'

select * from opadvmacview
