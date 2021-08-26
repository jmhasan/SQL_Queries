with outlet as (
select xzone,xdistrict,xthana,COALESCE((select distinct xstatus from routep where xid=caoutlet.xid and xstatus=1 ),0) xstatus

 from caoutlet where ztime <'2021-08-01' 
and xcus<>'NA' and xid in (select xid from routep) )
select xzone,xdistrict,xthana,COUNT(*) no_of_re,sum(xstatus) verified,COUNT(*)-sum(xstatus) unveryfied ,
(select COUNT(*) from julysales where  Zone_Name=outlet.xzone and xdistrict=outlet.xdistrict and   Xthana=outlet.Xthana   ) junesales from outlet
group by xzone,xdistrict,xthana


select * from julysales



select xid,Xthana,xdistrict from caoutlet where xthana is null  and xcus<>'NA' and xid in (select xid from routep )





