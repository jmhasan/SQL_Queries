DECLARE @fxdate AS date
DECLARE @txdate AS date
DECLARE @xyear as int
DECLARE @xper as int
SET @fxdate = '2021-08-01'
SET @txdate = '2021-08-23' 
set @xyear=2021
set @xper=08;

with xyz as ( 
select h.zid,xsub,d.xprime,--(case when xtrngl='INOP' and xyear='2020' and xper='3' then xqty else 0 end ) xqty, 
--(case when xtrngl='INOP' and h.xdate between '2020-09-01 06:00:00.000' and '2020-09-17 06:00:00.000' then xprime else 0 end ) saleamount, 
(case when xtrngl in ('CHQ-','BR--','JVNA','CR--','CRF-','JVI-','JV--') and h.xdate between @fxdate and @txdate then 
xprime else 0 end ) collectionamount 
from glheader h join gldetail d on h.xvoucher=d.xvoucher and h.zid=d.zid join cacus c on d.xsub=c.xcus and d.zid=c.zid 
where xtrngl<>'OB--' and h.xpostflag='Posted' and c.xsimcardno='Corporate' and CONVERT(date,DATEADD(HOUR,-6, h.xdate)) <=@txdate) 
, cte2 as( 
select zid,xsub,coalesce((select xsp from cacus where xcus=xyz.xsub),'') xriid, 
--coalesce((select xqty from opcustarget where xcus=xyz.xsub),0) xqtyst, 
--coalesce((select xamount from opcustarget where xcus=xyz.xsub),0) xamount, 
(select sum(xqtychl)/20 from opchallan ch join opchalland cd on ch.zid=cd.zid and ch.xchlnum=cd.xchlnum where ch.zid=xyz.zid and ch.xcus=xyz.xsub and 
CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between @fxdate and @txdate) salesqty, 
(select sum(xlineamt) from opchallan ch join opchalland cd on ch.zid=cd.zid and ch.xchlnum=cd.xchlnum where ch.zid=xyz.zid and ch.xcus=xyz.xsub and 
CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between @fxdate and @txdate) saleamount, 
--SUM(xqty) salesqty,SUM(saleamount) saleamount, 
SUM(collectionamount) collectionamount,SUM(xprime)balance from xyz 
group by zid,xsub) 
select xriid RI_Code,(select xname from prmst where zid=100000 and xemp=cte2.xriid) RI_Name , 
coalesce((select xqty from opritargetdt where xyear=@xyear and xper=@xper and xemp=cte2.xriid and xemp>''),0) SalesTarget, 
SUM(salesqty) salesqty,SUM(saleamount) saleamount,coalesce((select xamount from opritargetdt where xyear=@xyear and xper=@xper and xemp=cte2.xriid and xemp>''),0) SalesTarget, 
SUM(collectionamount) collectionamount, 
SUM(balance) balance,(SUM(balance)/SUM(saleamount))*30 DSO from cte2 
group by xriid order by xriid