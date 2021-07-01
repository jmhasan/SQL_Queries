with cte as (
select xsub,xorg,SUM(xprime) balance,
cast (min(case WHEN xprime>0 and H.xdate>'1900-01-01' THEN H.XDATE ELSE '2999-12-31' END) as DATE) firstDRDate,0 firstdramt,
cast (min(case WHEN xprime<0 and H.xdate>'1900-01-01' THEN H.XDATE ELSE '2999-12-31' END)as DATE) firstcrDate,0 firstcramt,
cast (max(case WHEN xprime>0 and H.xdate>'1900-01-01' THEN H.XDATE ELSE '1900-01-01' END)as DATE) lastDRDate,0 lastDRamt,
cast (max(case WHEN xprime<0 and H.xdate>'1900-01-01' THEN H.XDATE ELSE '1900-01-01' END)as DATE) lastcrDate,0 lastcrAMT,
c.xamount BG ,c.xsales SecurityAmt, sum(case WHEN  H.xtrngl='INOP' and d.xaccusage='AR' THEN d.xqty ELSE 0 END) Totalsales_qty 
from  glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher JOIN cacus C ON D.zid=C.zid AND D.xsub=C.xcus WHERE  
H.xtrngl<>'ob--'  AND xpostflag='Posted' and xsub='CUS-004947'
group by xsub,xorg,c.xamount ,c.xsales
)
select xsub,xorg,balance,
firstDRDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=cte.xsub and cast(xdate as date)=cte.firstDRDate and xprime>0 ) firstdramt,
(select SUM(xqtychl) from opchallan H JOIN opchalland D ON H.zid=D.zid AND H.xchlnum=D.xchlnum where h.xcus=cte.xsub and cast(xconfirmt as date)=cte.firstDRDate  and xstatuschl='3-Invoiced' ) firstdramtBAG,
firstcrDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=cte.xsub and cast(xdate as date)=cte.firstcrDate and xprime<0 ) firstcramt,
lastDRDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=cte.xsub and cast(xdate as date)=cte.lastDRDate and xprime>0 ) lastDRamt,
(select SUM(xqtychl) from opchallan H JOIN opchalland D ON H.zid=D.zid AND H.xchlnum=D.xchlnum where h.xcus=cte.xsub and cast(xconfirmt as date)=cte.lastDRDate  and xstatuschl='3-Invoiced' ) lastDRamtBAG,
lastcrDate,(select SUM(xprime) from glheader H JOIN gldetail D ON H.zid=D.zid AND H.xvoucher=D.xvoucher where xsub=cte.xsub and cast(xdate as date)=cte.lastcrDate and xprime<0 ) lastcrAMT,
BG,SecurityAmt,Totalsales_qty from cte