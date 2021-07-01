<<<<<<< HEAD
select ztime,xzone,xcus,xorg,dbo.cusname(xcus) Customer_Name,xrow,xid,xoutletname,xriid,dbo.empname(xriid) RI_Name,xziauth,xdistrict,Xthana from 
caoutlet where  xid='RNP-02314' --CUS-002332



select ztime,xzone,xdate,xriid,xcus,xorg,dbo.cusname(xcus),xid,xoutletname,xstatus,xstatusjob,xday,xname,
(cast(xlat as varchar)+','+cast(xlong as varchar)) as xlong from    routep  where   xid='RNP-02314'
and xname='WED'
=======
select ztime,xzone,xcus,xorg,dbo.cusname(xcus) Customer_Name,xrow,xid,xoutletname,xriid,dbo.empname(xriid) RI_Name,xziauth,xdistrict from 
caoutlet where xid in ('NGN-00239','NGN-00224') --002514

select xzone,xdate,xriid,xid,xoutletname,xcus,xorg,dbo.cusname(xcus),xstatus,xstatusjob,xname,xproprietor,xaddress,
(cast(xlat as varchar)+','+cast(xlong as varchar)) as xlong from    routep  where xid in ('NGN-00239','NGN-00224')
>>>>>>> 4641648a8ef7c75b29ac42b9a3a7a5cd299a8b27

select * from cacus where xcus='CUS-006545'

select * from cacusrii where xcus='CUS-006545'


select * from cacushrc where xriid in ('002304','002475','002500') and  xtsoid='001458'
select * from cacushrc where xtsoid='001458'

select xcus,xorg,xstatuscus from cacus where xcus='CUS-005892'

select * from dealerfilter where xtsoid='001458'

select * from demorouteplan2 where xid ='NA'

select * from xcodes where xtype='OfferType' or xtype='Gifttype'


select * from zxusers where zemail like '%sami%' 

select * from  brandname
select * from  offertable

select *,dbo.empname(xtsoid) from cacushrc where xziid='000021'
