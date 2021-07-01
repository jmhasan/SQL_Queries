--PO Header and Details Table
select xpornum,xwh,xsup,xstatuspor from poord where xpornum='PCMLWPO-0121-000078' --New
select xpornum,xwh,xitem,xqtyord,xqtygrn,xpornum from poodt where xpornum='PCMLWPO-0121-000078' --xqtygrn=0

--Requistion Header and details table 
select * from poreq where xporeqnum ='PCMLREQ-1020-000215'
select * from poreqd where xporeqnum ='PCMLREQ-1020-000215'


--MRR Header and details Table
select * from  pogrn where xgrnnum='PCMLMRR-0121-000099'
select * from  pogdt where xgrnnum='PCMLMRR-0121-000099'

select * from  pogdtbat where xgrnnum='PCMLMRR-0121-000099'