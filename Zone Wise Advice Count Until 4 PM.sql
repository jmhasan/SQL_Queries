with dummyadvice as  (
select  (case when  xzonedel='JESSORE' or xzonedel='JESSORE-1(Gopalgonj & Magura)' then 'KHULNA'
when xzonedel='MUNSHIGONJ' or xzonedel='RETAILER' then 'NARAYANGONJ'  else xzonedel end ) xzone,
SUM(xqtysms)/20 xqtysms ,COUNT(*)  No_of_advice from opadvice where xstatusadvmach not in ('5-Voided','1-Open') and 
xconfirmt between '2020-04-25 06:00:00.000' and '2020-04-25 16:00:00.000' and dumzid=0
group by xzonedel
union all
select  (case when  xzone='JESSORE' or xzone='JESSORE-1(Gopalgonj & Magura)' then 'KHULNA'
when xzone='MUNSHIGONJ' or xzone='RETAILER' then 'NARAYANGONJ'  else xzone end ) xzone,
SUM(xqtysms/20) xqtysms,count(*) No_of_advice from opadvicedsl where 
 ztime between '2020-04-25 06:00:00.000' and '2020-04-25 16:00:00.000' and xziid>0 group by xzone)
select xzone,SUM(xqtysms),SUM(No_of_advice) from dummyadvice group by xzone