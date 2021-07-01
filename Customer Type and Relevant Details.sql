
with abc as (
select h.xcus,
sum(case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=1 then d.xqtychl else  0 end) "JAN",
sum(case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=2 then d.xqtychl else  0 end)  "FEB",
sum(case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=3 then d.xqtychl else  0 end ) "MAR",
sum(case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=4 then d.xqtychl else  0 end )"APR",
sum(case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=5 then d.xqtychl else  0 end )"MAY",
sum(case when month( CONVERT(date,DATEADD(HOUR,-6,xconfirmt)))=6 then d.xqtychl else  0 end )"JUN" 
from opchallan h join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum  where
  CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) between '2021-01-01' and '2021-06-21'-- and h.xcus='CUS-006209'
  group by h.xcus )
select xbloodgrp "Zone",a.xcus "Customer Code",xorg "Customer Name",xgcus "Type",xdistrict District,xsp "Sales Person ID" ,
(select xname from prmst where xemp=c.xsp) "Sales Person Name",ztime "Time of CUS ID Creation",
xprbasicapp  "General Commission/Volume Commission",
 xprpfapp "Realistic Target Commission/Special Target Commission",
 xprbonusapp "Retail Commission",
 xpritaxapp "Lifting/Delivery commissions",
 xprarrearapp "Cash Discount offer/ Spot Discount offer",
 xprsuspapp "Free Bags Commission",
 xprsubsistapp "Yearly Commission",
 xpartial "Cash Party?",
 xprobe "Promotional Offer",
 xamount "Bank Guarantee Amount",
 xsales "Security Cheque Amount",
 xqtygrn "Approved Credit Limit",
 xcrlimit "Credit Limit" , JAN,FEB,MAR,APR,MAY,JUN,(select sum(xprime) from glheader h join gldetail d on h.zid=d.zid and h.xvoucher=d.xvoucher where 
    xtrngl not in ('OB--','OPN-')  and xpostflag='Posted' and d.xsub=c.xcus) "Ledger Balance"
from abc  a join cacus c on a.xcus=c.xcus where c.xsimcardno in ('Dhaka','Out Dhaka')
