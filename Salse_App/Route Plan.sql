select * from routep where xzone in ('DHAKA NORTH','DHAKA MIDDLE') and xstatus='1' and xstatusjob='1'

select ztime,xzone,xcus,xorg,dbo.cusname(xcus) Customer_Name,xrow,xid,xoutletname,xriid,dbo.empname(xriid) RI_Name,xziauth,xdistrict,xproprietor from 
caoutlet where xid ='SRJ-28165'

select xzone,xdate,xriid,xid,xoutletname,xcus,xorg,xstatus,xstatusjob,xname,xproprietor,xaddress,
(cast(xlat as varchar)+','+cast(xlong as varchar)) as xlong from    routep  where xid ='BRS-28141'
and xname='WED' and xriid='002022'

select * from  outletcalllog  where xid='DHK-02760'

--Step-01
select * from  brandlisting  where xid='DHK-02760'
--Step-02
select * from  outletcall  where xid='DHK-02760'
--Step-03
select * from  offertable  where xid='DHK-02760'
--Step-04
select * from  paymentmgmt where xid='DHK-02760'



select xid,count(*) from routep  where xname='MON'
group by xid HAVING count(*)>1

select * from routep where xid='JSS-00177'


select *  from caoutlet  where xid='JSS-00177'

select * from zxusers where zemail='mamunoor.rahman@premiercement.com'


select * from opadviceapp where xid='LLM-00069' and xflag=1


--for create view of verified route plan list
select c.xzone,c.xid,c.xoutletname,c.xcus,c.xorg,c.xproprietor,c.xmobile,c.xaddress,c.xolat,c.xolong,c.xlink,c.xlink1,
c.xriid,c.xriname,r.xname,r.xstatus,r.xstatusjob from caoutlet c join routep r on c.xid=r.xid where xname='WED' and r.xstatus=1
