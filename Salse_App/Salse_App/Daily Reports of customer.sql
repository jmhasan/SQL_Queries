DECLARE @xdate datetime
SET @xdate = '2020-02-12 06:00:000'
select xsub,xorg,xzone,
coalesce(((select sum(xqtyord-xqtychl) from opdorddt where xcus=glheaderdetailcus.xsub and xstatusdor<>'C-Cancelled')+
coalesce((select  sum(xqtymach) from opmachadviced  md  join opmachadv mh on md.zid=mh.zid and md.xmachnum=mh.xmachnum  
where (md.zutime>@xdate or  md.xchallantime >@xdate  or xstatusmach<>'4-Challaned') and md.xdornum<>'' and xqtymach>0 
 and md.xcus=glheaderdetailcus.xsub),0)),0) undeliqty,
coalesce(((select sum((xqtyord-xqtychl)*(xrate+xchgdel)) from opdorddt where xcus=glheaderdetailcus.xsub and xstatusdor<>'C-Cancelled')+
(select  sum(xlineamt) from opmachadviced  md  join opmachadv mh on md.zid=mh.zid and md.xmachnum=mh.xmachnum  
where (md.zutime>@xdate or  md.xchallantime >@xdate  or xstatusmach<>'4-Challaned') and md.xdornum<>'' and xqtymach>0  and md.xcus=glheaderdetailcus.xsub)),0)undelamnt,
coalesce((select sum(xqty) from opdorddt where xcus=glheaderdetailcus.xsub and xconfirmt between @xdate-1 and @xdate),0) ondateDO,
coalesce((select sum(xlineamt) from opdorddt where xcus=glheaderdetailcus.xsub and xconfirmt between @xdate-1 and @xdate),0) ondateDOamnt,
sum(case when xtrngl in ('CHQ-','BR--','JVNA','CR--','CRF-','JVI-','JV--')  and xdate=convert(date,@xdate-1) then xprime else 0 end) ondatepayment,
sum(case when xtrngl='INOP' and xdate between @xdate-1 and @xdate then xqty else 0 end )ondatedelivery,
sum(case when xtrngl='INOP' and xdate between @xdate-1 and @xdate then xprime else 0 end )ondatedeliveryamnt,sum(xprime) balance
from glheaderdetailcus  where xtrngl not in ('OB--','OPN-')  and xpostflag='Posted' and xdate<=@xdate
and xzone ='DHAKA NORTH'
group by zid,xsub,xorg,xzone

select md.zutime,md.xchallantime,md.xmachnum,md.xitem,md.xcus,md.xordernum,md.xwh,md.xlineamt,md.xchlnum,md.xdornum,
md.xqtycrn,xqtymach from opmachadviced md  join opmachadv mh on md.zid=mh.zid and md.xmachnum=mh.xmachnum  
where (md.zutime>'2020-02-09 06:00:000' or  md.xchallantime >'2020-02-09 06:00:000'  or xstatusmach<>'4-Challaned') 
and md.xdornum<>'' and xqtymach>0  and md.xcus='CUS-000321'  order by xstatusmach