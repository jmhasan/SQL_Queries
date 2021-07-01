with abc as (
select xid,xriid,xbrand,sum(xstock) xstock,sum(xmsales) xmsales,sum(xbuyrate) xbuyrate,sum(xsrate) xsrate,COUNT(*) day from outletcall where xbrand not like '%Premier%'
 group by xid,xriid,xbrand)

select 
(select xzone from cacushrc where xriid=a.xriid) xzone,
a.xid,(select xoutletname from caoutlet where xid=a.xid) xoutletname,a.xriid,dbo.empname(a.xriid) RI_Name,
(select xtsoid from cacushrc where xriid=a.xriid) xtsoid, 
dbo.empname((select xtsoid from cacushrc where xriid=a.xriid)) AI_Name,
(select xziid from cacushrc where xriid=a.xriid) xziid,
dbo.empname((select xziid from cacushrc where xriid=a.xriid)) ZI_Name,

a.xbrand,b.laststock Stock,
b.xbuyrate,b.xsrate,xstock/day avgxstock,a.xmsales/day xmsales,a.xbuyrate/day avgxbuyrate,a.xsrate/day avgxsrate from abc a  join brandlisting b on 
a.xid=b.xid and a.xbrand=b.xbrand
order by xbrand  

