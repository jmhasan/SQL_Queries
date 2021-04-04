---Challan Qty Missmatch in betwen Advice and challan
select h.xadvnum,a.xqtychl,sum(d.xqtychl) from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join opadvice a on a.zid=h.zid and a.xadvnum=h.xadvnum where h.xadvnum<>'' and xstatuschl='3-Invoiced'
group by h.xadvnum,a.xqtychl having sum(d.xqtychl)<>a.xqtychl

select  xadvnum,xqtysms,xqty,xqtychl,xqtycut,xchallantime,xstatusadvmach from opadvice where xadvnum='PCMLDOA-0121-013536' 

select xmachnum,xchlnum,xconfirmt from opchallan where xadvnum='PCMLDOA-0121-013536'
select xmachnum,xchallantime from opmachadviced where xadvnum='PCMLDOA-0121-013536'

---Challan Qty>0 but advice no not in challan 
select xadvnum,xconfirmt,xqtysms,xqtychl,xqty,xqtycut,xstatusadvmach,xchallantime,xchkt from opadvice  
where xqtychl>0 and xadvnum not in (select xadvnum from opchallan where xadvnum<>'')

---Matching Qty Missmatch in betwen Advice and Matching
select a.xadvnum,a.xqty,sum(d.xqtycrn) from opmachadv h join opmachadviced d on h.zid=d.zid and h.xmachnum=d.xmachnum
join opadvice a on a.zid=d.zid and a.xadvnum=d.xadvnum -- where xstatusmach<>'1-Open'
group by a.xadvnum,a.xqty having sum(d.xqtycrn)<>a.xqty

---Matching Qty Missmatch in betwen matching and challan
select h.xmachnum,sum(m.xqtymach),sum(d.xqtychl) from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join opmachadviced m on m.zid=h.zid  and m.xmachnum=h.xmachnum and d.xrow=m.xrow where h.xadvnum<>''
group by h.xmachnum having sum(d.xqtychl)<>sum(m.xqtymach)

select SUM(xqtymach) from opmachadviced where xmachnum='PCMLDOAM0819-000037' group by xmachnum

select h.xmachnum,SUM(xqtychl),(select SUM(xqtymach) from opmachadviced where xmachnum=h.xmachnum) from opchallan h join  opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum where 
 h.xmachnum='PCMLDOAM1019-003635' group by h.xmachnum


select * from opadvice where xadvnum='PCMLDOA-1219-012133'
