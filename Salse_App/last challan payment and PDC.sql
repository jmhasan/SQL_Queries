with cte as (
select xsub,sum(case WHEN   xpostflag='Posted'   then xprime ELSE 0 END) balance ,
sum(case WHEN  d.xpaytype='Cheque' and xstatusjv in ('Cheque Bounced','Cheque in Hand') and h.xdatedue<>'2999-12-31'  then xprime ELSE 0 END) PDC ,
cast (min(case WHEN xprime>0 and H.xdate>'1900-01-01' AND xpostflag='Posted' THEN H.XDATE ELSE '2999-12-31' END) as DATE) firstDRDate,0 firstdramt,
cast (min(case WHEN xprime<0 and H.xdate>'1900-01-01'  AND xpostflag='Posted' THEN H.XDATE ELSE '2999-12-31' END)as DATE) firstcrDate,0 firstcramt,
cast (max(case WHEN xprime>0 and H.xdate>'1900-01-01' AND xpostflag='Posted' THEN H.XDATE ELSE '1900-01-01' END)as DATE) lastDRDate,0 lastDRamt,
cast (max(case WHEN xprime<0 and H.xdate>'1900-01-01'  AND xpostflag='Posted' THEN H.XDATE ELSE '1900-01-01' END)as DATE) lastcrDate,0 lastcrAMT,
--c.xamount BG ,c.xsales SecurityAmt,
sum(case WHEN  H.xtrngl='INOP' and d.xaccusage='AR' THEN d.xqty ELSE 0 END) Totalsales_qty 
from  glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher JOIN cacus C ON D.zid=C.zid AND D.xsub=C.xcus WHERE  
H.xtrngl<>'ob--'  and xsimcardno='Corporate'
group by xsub --,c.xamount ,c.xsales
)
select xsub,xorg,xbloodgrp,balance,PDC,
firstDRDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=e.xsub and cast(xdate as date)=e.firstDRDate and xprime>0 ) firstdramt,
(select SUM(xqtychl) from opchallan H JOIN opchalland D ON H.zid=D.zid AND H.xchlnum=D.xchlnum where h.xcus=e.xsub and cast(xconfirmt as date)=e.firstDRDate  and xstatuschl='3-Invoiced' ) firstdramtBAG,
firstcrDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=e.xsub and cast(xdate as date)=e.firstcrDate and xprime<0 ) firstcramt,
lastDRDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=e.xsub and cast(xdate as date)=e.lastDRDate and xprime>0 ) lastDRamt,
(select SUM(xqtychl) from opchallan H JOIN opchalland D ON H.zid=D.zid AND H.xchlnum=D.xchlnum where h.xcus=e.xsub and cast(xconfirmt as date)=e.lastDRDate  and xstatuschl='3-Invoiced' ) lastDRamtBAG,
lastcrDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=e.xsub and cast(xdate as date)=e.lastcrDate and xprime<0 ) lastcrAMT,
cd.xamount BG ,cd.xsales SecurityAmt,Totalsales_qty from cte e join cacus cd on e.xsub=cd.xcus