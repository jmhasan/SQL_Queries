
with abc as (
select c.xbloodgrp xzone,h.xcus,c.xorg,c.xgcus,CONVERT(date,DATEADD(HOUR,-6,c.ztime)) Create_Time,xcrlimit Credit_limit, xamount BG,xsales Cheque,
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=1 then d.xqtychl else  0 end "JAN",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2 then d.xqtychl else  0 end  "FEB",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=3 then d.xqtychl else  0 end  "MAR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=4 then d.xqtychl else  0 end  "APR",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=5 then d.xqtychl else  0 end  "MAY",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqtychl else  0 end  "JUN",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=7 then d.xqtychl else  0 end "JUL",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=8 then d.xqtychl else  0 end "AGU",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=9 then d.xqtychl else  0 end "SEP",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=10 then d.xqtychl else  0 end "OCT",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=11 then d.xqtychl else  0 end "NOV",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=12 then d.xqtychl else  0 end "DEC"
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum 
join cacus c on h.zid=c.zid and h.xcus=c.xcus where  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-01-01' and '2021-08-17' and
c.xsimcardno in ('Dhaka','Out Dhaka') and CONVERT(date,DATEADD(HOUR,-6,c.ztime))>='2021-01-01')

select xzone,xcus,xorg,xgcus,Create_Time,Credit_limit,BG,Cheque,(select xnetrate from cacuscemrate where xcus =abc.xcus and xitem='02-01-001-0005') PCC_BM_Rate,
sum(JAN) JAN, sum(FEB) FEB ,sum(MAR) MAR, sum(APR) APR, sum(MAY) MAY, sum(JUN) JUN, 
sum(JUL) JUL, sum(AGU) AGU , sum(SEP) SEP , sum(OCT) OCT, sum(NOV) NOV,  sum(DEC) DEC
from  abc group by xzone,xcus,xorg,xgcus,Create_Time,Credit_limit,BG,Cheque


