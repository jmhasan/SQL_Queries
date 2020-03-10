select * from glheader where xvoucher='PCMLBR--0118-001391'

select * from gldetail 
where  xvoucher in (select xvoucher from glheader where xdate='2018-01-30' and 
 xtrngl in('CHQ-','BR--','JVNA','CR--','CRF-')) and xvoucher='PCMLBR--0118-001391'