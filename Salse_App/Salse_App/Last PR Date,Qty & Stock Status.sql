select xitem,xdesc,xunitstk,coalesce((select sum(xqty*xsign) from imtrn where xitem=caitem.xitem),0) as stock,
(select MAX(xdatereq) from poreq h join  poreqd d on h.zid=d.zid and h.xporeqnum=d.xporeqnum where d.xitem=caitem.xitem) as last_pr_date,
(select  sum(xqtyreq) from poreq h join  poreqd d on h.zid=d.zid and h.xporeqnum=d.xporeqnum where d.xitem=caitem.xitem 
and xdatereq=(select MAX(xdatereq) from poreq h join  poreqd d on h.zid=d.zid and h.xporeqnum=d.xporeqnum where d.xitem=caitem.xitem))
 from caitem where xcitem='13-01'
group by xitem,xdesc,xunitstk