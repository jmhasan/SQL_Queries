with retail as (
select o.xzone,o.xcus,o.xorg,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid,xconfirmt,h.xchlnum,(d.xqtychl) total,
case when year( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2020  and month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=8 then d.xqtychl else  0 end "AUG2020",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=9 then d.xqtychl else  0 end "SEP2020",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=10 then d.xqtychl else  0 end  "OCT2020",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=11 then d.xqtychl else  0 end  "NOV2020",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=12 then d.xqtychl else  0 end  "DEC2020",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=1 then d.xqtychl else  0 end "JAN2021",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2 then d.xqtychl else  0 end  "FEB2021",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=3 then d.xqtychl else  0 end  "MAR2021",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=4 then d.xqtychl else  0 end  "APR2021",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=5 then d.xqtychl else  0 end  "MAY2021",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqtychl else  0 end  "JUN2021",
case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=7 then d.xqtychl else  0 end  "JUL2021",
case when  CONVERT(date,DATEADD(HOUR,-6,xconfirmt))>='2021-08-07' then d.xqtychl else  0 end "AUG2021"
 from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and h.xordernum=o.xid
where  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2020-08-01' and CONVERT(date,getdate()-1) and
coalesce(h.xdornum,'')<>'Allocated' 
 union all
 select o.xzone, o.xcus,o.xorg,o.xid,o.xoutletname,o.xthana,o.xdistrict,o.xriid, xconfirmt,h.xchlnum, (d.xqty) total,
case when year( d.xdate)=2020  and month( d.xdate)=8 then d.xqty else  0 end "AUG2020",
case when month(d.xdate)=9 then d.xqty else  0 end "SEP2020",
case when month(d.xdate)=10 then d.xqty else  0 end  "OCT2020",
case when month( d.xdate)=11 then d.xqty else  0 end  "NOV2020",
case when month(d.xdate)=12 then d.xqty else  0 end  "DEC2020",
case when month( d.xdate)=1 then d.xqty else  0 end "JAN2021",
case when month( d.xdate)=2 then d.xqty else  0 end  "FEB2021",
case when month( d.xdate)=3 then d.xqty else  0 end  "MAR2021",
case when month(d.xdate)=4 then d.xqty else  0 end  "APR2021",
case when month( d.xdate)=5 then d.xqty else  0 end  "MAY2021",
case when month(d.xdate)=6 then d.xqty else  0 end  "JUN2021",
case when month(d.xdate)=7 then d.xqty else  0 end  "JUL2021",
case when d.xdate>='2021-08-07' then d.xqty else  0 end "AUG2021"
from opchallan h join opchallanalc d on h.zid=d.zid and h.xchlnum=d.xchlnum
join cacus c on c.zid=h.zid and c.xcus=h.xcus  join caoutlet o on h.zid=o.zid and d.xid=o.xid
where  d.xdate between '2020-08-01' and  CONVERT(date,getdate()-1) and coalesce(h.xdornum,'')='Allocated' )

select xzone,xcus,xorg,xid,xoutletname,xthana,xdistrict,xriid,(select xname from prmst where xemp=retail.xriid) RI_Name, (select xtsoid from cacushrc where xriid=retail.xriid) xtsoid,
(select xname from prmst where xemp=(select xtsoid from cacushrc where xriid=retail.xriid)) AI_Name,
(select xziid from cacushrc where xriid=retail.xriid) xziid,
(select xname from prmst where xemp=(select xziid from cacushrc where xriid=retail.xriid) ) ZI_Name,
sum(AUG2020) "AUG2020",sum(SEP2020) SEP2020,sum(OCT2020) OCT2020,sum(NOV2020) NOV2020,sum(DEC2020) DEC2020,SUM(JAN2021) JAN2021,
sum(FEB2021) FEB2021,sum(MAR2021) MAR2021,sum(APR2021) APR2021,sum(MAY2021) MAY2021,sum(JUN2021) JUN2021,sum(JUL2021) JUL2021,sum(AUG2021) AUG2021 from retail 
group by xzone,xcus,xorg,xid,xoutletname,xthana,xdistrict,xriid