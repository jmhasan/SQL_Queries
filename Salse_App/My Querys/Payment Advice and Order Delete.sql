
--Payment Delete
select * from   Payment where ZoneID=4 and ZIID=0 and PaymentDate='2020-12-14' and PaymentID=117458 or PaymentID=117529

select * from erp200.ERPonTheNet.dbo.capayment where xisstrn in ('117458','117529')

--Order Dlete
select * from  OrderInfo where ZoneID=4 and ZIID=0 and OrderDate='2020-12-14' and OrderID=59855 or OrderID=59867

select * from erp200.ERPonTheNet.dbo.opordonline where xtrnnum='59855'

--Advice Delete

select * from  Advice where ZoneID=4 and ZIID=0 and AdviceDate='2020-12-13' and AdviceID=107816