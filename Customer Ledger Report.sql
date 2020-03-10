select xsub,xorg,xzone,sum(xprime) balance,
(select sum(xqtyord-xqtychl) from opdorddt where xcus=glheaderdetailcus.xsub and xstatusdor<>'C-Cancelled') undeliqty,
(select sum((xqtyord-xqtychl)*(xrate+xchgdel)) from opdorddt where xcus=glheaderdetailcus.xsub and xstatusdor<>'C-Cancelled') undelamnt,
(select sum(xqty) from opdorddt where xcus=glheaderdetailcus.xsub and
 xconfirmt between '2020-02-03 06:00:000' and '2020-02-04 06:00:000') ondateDO,
 (select sum(xlineamt) from opdorddt where xcus=glheaderdetailcus.xsub and
 xconfirmt between '2020-02-03 06:00:000' and '2020-02-04 06:00:000') ondateDOamnt,
 sum(case when xtrngl in ('CHQ-','BR--','JVNA','CR--','CRF-','JVI-','JV--') then xprime else 0 end)payment,
 sum(case when xtrngl='INOP' and xdate between '2020-02-03 06:00:000' and '2020-02-04 06:00:000' 
 then xqty else 0 end )ondatedelivery,
 sum(case when xtrngl='INOP' and xdate between '2020-02-03 06:00:000' and '2020-02-04 06:00:000' 
 then xprime else 0 end )ondatedeliveryamnt
 from glheaderdetailcus  where xdate<='2020-02-04 06:00:000' and xtrngl not in ('OB--','OPN-')  and xpostflag='Posted'
 and xzone='DHAKA NORTH'
group by xsub,xorg,xzone