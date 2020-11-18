with xyz as ( 
select h.zid,xsub,d.xprime,--(case when xtrngl='INOP' and xyear='2020' and xper='3' then xqty else 0 end ) xqty, 
--(case when xtrngl='INOP' and h.xdate between '2020-09-01 06:00:00.000' and '2020-09-17 06:00:00.000' then xprime else 0 end ) saleamount, 
(case when xtrngl in ('CHQ-','BR--','JVNA','CR--','CRF-','JVI-','JV--') and h.xdate between '2020-11-01' and '2020-11-17' then 
xprime else 0 end ) collectionamount 
from glheader h join gldetail d on h.xvoucher=d.xvoucher and h.zid=d.zid join cacus c on d.xsub=c.xcus and d.zid=c.zid 
where xtrngl<>'OB--' and h.xpostflag='Posted' and c.xsimcardno='Corporate' and h.xdate <='2020-11-18 06:00:00.000') 
, cte2 as( 
select zid,xsub,coalesce((select xsp from cacus where xcus=xyz.xsub),'') xriid, 
--coalesce((select xqty from opcustarget where xcus=xyz.xsub),0) xqtyst, 
--coalesce((select xamount from opcustarget where xcus=xyz.xsub),0) xamount, 
(select sum(xqtychl)/20 from opchallan ch join opchalland cd on ch.zid=cd.zid and ch.xchlnum=cd.xchlnum where ch.zid=xyz.zid and ch.xcus=xyz.xsub and 
xconfirmt between '2020-11-01 06:00:00.000' and '2020-11-18 06:00:00.000') salesqty, 
(select sum(xlineamt) from opchallan ch join opchalland cd on ch.zid=cd.zid and ch.xchlnum=cd.xchlnum where ch.zid=xyz.zid and ch.xcus=xyz.xsub and 
xconfirmt between '2020-11-01 06:00:00.000' and '2020-11-18 06:00:00.000') saleamount, 
--SUM(xqty) salesqty,SUM(saleamount) saleamount, 
SUM(collectionamount) collectionamount,SUM(xprime)balance from xyz 
group by zid,xsub) 
select xriid RI_Code,(select xname from prmst where zid=100000 and xemp=cte2.xriid) RI_Name , 
coalesce((select xqty from opritargetdt where xyear=2020 and xper=11 and xemp=cte2.xriid and xemp>''),0) SalesTarget, 
SUM(salesqty) salesqty,SUM(saleamount) saleamount,coalesce((select xamount from opritargetdt where xyear=2020 and xper=11 and xemp=cte2.xriid and xemp>''),0) SalesTarget, 
SUM(collectionamount) collectionamount, 
SUM(balance) balance,(SUM(balance)/SUM(saleamount))*30 DSO from cte2 
group by xriid order by xriid