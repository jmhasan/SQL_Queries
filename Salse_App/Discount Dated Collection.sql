with payment as (
select xsub,c.xorg,xbloodgrp,c.xdistrict,
(case when  h.xdate ='2019-12-02' or h.xdate ='2019-12-05' or h.xdate ='2019-12-09'
 or h.xdate ='2019-12-12' or h.xdate ='2019-12-19' or h.xdate ='2019-12-22'
 or h.xdate ='2019-12-24' or h.xdate ='2019-12-29' then xprime else 0 end ) dec_19,
 (case when  h.xdate ='2020-07-02' or h.xdate ='2020-07-09' or h.xdate ='2020-07-13'
 or h.xdate ='2020-07-16' or h.xdate ='2020-07-19' or h.xdate ='2020-07-23'
 then xprime else 0 end ) july_20,
  (case when  h.xdate ='2020-09-03' or h.xdate ='2020-09-10' or h.xdate ='2020-09-14'
 or h.xdate ='2020-09-17' or h.xdate ='2020-09-24' or h.xdate ='2020-09-28'
 then xprime else 0 end ) sept_20,
  (case when  h.xdate ='2020-10-01' or h.xdate ='2020-10-08' or h.xdate ='2020-10-12'
 or h.xdate ='2020-10-15' or h.xdate ='2020-10-22' 
 then xprime else 0 end ) octo_20
 from glheader h join gldetail d on h.zid=d.zid 
and h.xvoucher=d.xvoucher join cacus c on d.zid=c.zid and d.xsub=c.xcus
 where xtrngl in ('CHQ-','BR--','JVNA','CR--','CRF-','JVI-','JV--') 
 and xpostflag='Posted' and xstatusjv = 'Balanced' and xprime<0 and
c.xcus in ('CUS-000340','CUS-000321','CUS-001986','CUS-000041','CUS-001670','CUS-000352','CUS-000157','CUS-002195',
'CUS-000150','CUS-000060','CUS-000015','CUS-000376','CUS-005670','CUS-004356','CUS-000381','CUS-000131',
'CUS-000152','CUS-000156','CUS-005124','CUS-003833','CUS-000067','CUS-000014','CUS-000143','CUS-004909',
'CUS-003549','CUS-000217','CUS-004138','CUS-001854','CUS-005159','CUS-000374','CUS-000119','CUS-005643',
'CUS-001877','CUS-001752','CUS-000412','CUS-003463','CUS-003010','CUS-001679','CUS-002702','CUS-004984',
'CUS-000371','CUS-003807','CUS-002517','CUS-004380','CUS-004078','CUS-003888','CUS-002838','CUS-002716',
'CUS-001489','CUS-000366'))
select xsub,xorg,xbloodgrp,xdistrict,sum(0-dec_19) dec_19,sum(0-july_20) july_20,sum(0-sept_20) sept_20,
sum(0-octo_20) octo_20 from payment
group by xsub,xorg,xbloodgrp,xdistrict
