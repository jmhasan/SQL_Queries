
with abc as (
select h.xsornum,xdriver,xqtybagrec,trkm,
sum(case when xvmcode='Diesel from Outside' then  d.xrate else 0 end) "Diesel_from_Outside",
sum(case when xvmcode='Extra Labour Charge(Dholai)' then  d.xrate else 0 end) "Extra_Labour_Charge",
sum(case when xvmcode='Labour Charge' then  d.xrate else 0 end) "Labour Charge",
sum(case when xvmcode='Miscellaneous Expense' then  d.xrate else 0 end) "Miscellaneous_Expense",
sum(case when xvmcode='Tips - Labour' then  d.xrate else 0 end) "Tips_Labour",
sum(case when xvmcode='Tips - Police' then  d.xrate else 0 end) "Tips_Police",
sum(case when xvmcode='Tips Token (Fixed)' then  d.xrate else 0 end) "Tips_Token",
sum(case when xvmcode='Toll' then  d.xrate else 0 end) "Toll",
sum(case when xvmcode='Trip Commission-Driver' then  d.xrate else 0 end) "Trip_Commission_Driver",
sum(case when xvmcode='Trip Commission-Helper' then  d.xrate else 0 end )"Trip_Commission_Helper"
 from vmmovereg h join  vmmoveregrtrevtrns d on h.zid=d.zid and h.xsornum=d.xsornum where h.ztime BETWEEN '2021-03-01 06:00' and '2021-03-31 06:00'
 and xstatusmove='2-Closed'

 group by h.xsornum,xdriver,xqtybagrec,trkm), xyz as (
 select xdriver,sum(xqtybagrec) xqtybagrec,sum(trkm) trkm,sum(Diesel_from_Outside) Diesel_from_Outside,

 sum(Extra_Labour_Charge) "Extra_Labour_Charge", sum(Miscellaneous_Expense) Miscellaneous_Expense,
sum(Tips_Labour) Tips_Labour,sum(Tips_Police) Tips_Police, sum(Tips_Token) "Tips_Token", sum(Toll) Toll,
sum(Trip_Commission_Driver) Trip_Commission_Driver, sum(Trip_Commission_Helper) Trip_Commission_Helper,count(distinct xsornum) No_of_Trip
  from abc  group by xdriver)
  select xdriver,d.xname,d.xmobile,d.xjoindate,MONTH(xjoindate) Service_Len,xstatusemp,xqtybagrec,trkm,Diesel_from_Outside,
   Extra_Labour_Charge  "Extra_Labour_Charge(Dholai)", Miscellaneous_Expense,Tips_Labour,Tips_Police,Tips_Token "Tips_Token (Fixed)",
   Trip_Commission_Driver,Trip_Commission_Helper,No_of_Trip from xyz h join prmst d on  h.xdriver=d.xemp


  




