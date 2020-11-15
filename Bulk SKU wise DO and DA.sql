WITH opsalesdo 
AS(
select h.zid,h.xcus,d.xitem,sum(case when xdate>='2020-11-01' then xqty else 0 end )/20 xqty,sum(xqty-xqtychl)/20 DORemaining,0 xqtysms,0 DARemaining from opdor h join opddt d on h.zid=d.zid and h.xdornum=d.xdornum 
where xstatusdor<>'C-Cancelled'  and xtypecat like '%Bulk%' group by h.zid,h.xcus,d.xitem 
union all
select zid,xcus,xsmsitem xitem,0 xqty,0 DORemaining,sum(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt))>='2020-11-01' then xqtysms else 0 end)/20 xqtysms,sum(xqtysms-xqtychl)/20 as DARemaining from opadvice where 
xstatusadvmach not in ('5-Voided','1-Open')  and xsmstypecat like '%Bulk%'  --and xcus='CUS-000041' 
group by zid,xcus,xsmsitem)

select t.xcus,c.xorg,xitem,(select xdesc from caitem where xitem=t.xitem and zid=100000) xdesc,
sum(xqty) DO,sum(xqtysms) DA, sum(DORemaining) DORemaining,sum(DARemaining) DARemaining from 
opsalesdo t join cacus c on t.zid=c.zid and t.xcus=c.xcus where xsimcardno<>'Bag Plant' 
group by t.zid,t.xcus,c.xorg,xitem



