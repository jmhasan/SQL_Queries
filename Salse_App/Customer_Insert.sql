
insert into PremierCementOnline.dbo.Customer(CustomerCode,CustomerName,Address,Mobile,CustomerTypeID,DealerID,FreeBag,
SecurityAmount,Email,RouteID,CreatedAt,UserID)
select xcus,xorg+' ('+xbloodgrp+') ',xoffadd,'',(case when xsimcardno='Corporate' then 3 else 2 end) ,1,xperc,0,'test@gmail.com',0,CURRENT_TIMESTAMP,11
 from erp200.ERPonTheNet.dbo.cacus 
where xcus  not in (SELECT      CustomerCode FROM          PremierCementOnline.dbo.Customer  ) and xcus<>'000002' 
and xstatuscus<>'6-Held'


select * from OrderInfo where  OrderID not in (select xrow from   erp200.ERPonTheNet.dbo.opordonline )

select * from  payment where paymentid not in (select xrow from   erp200.ERPonTheNet.dbo.capayment )
and  paymentid <66835


select *,(select xorg+' -'+xbloodgrp from erp200.ERPonTheNet.dbo.cacus 
where xcus=Customer.CustomerCode ) from customer where CustomerCode   in (SELECT    xcus   FROM        erp200.ERPonTheNet.dbo.cacus 
where xspouse='Joypurhat'  )

select * from   erp200.ERPonTheNet.dbo.cacus  where xbloodgrp='Dhaka Middle'

select  * from vAllCustomerEmployee where ZIID=37 and Zonename='DHAKA MIDDLE'

select *,(select email from [User] where EmployeeID=ZoneDetail.ziid) from ZoneDetail where ZoneID=5 or  ZoneID=6

select ZoneID,COUNT(*) from ZoneDetail group by zoneid

select * from SalesPerson where CustomerID =(select customerid from Customer where CustomerCode='CUS-001584')

select *,(select RouteName from RouteInfo where RouteID=RouteDetailInfo.RouteID),
(select Employeename from Employee where EmployeeID=RouteDetailInfo.riid),
(select email from [User] where EmployeeID=RouteDetailInfo.riid) from RouteDetailInfo where RIID=315

select * from Customer where CustomerName like '%cocola%'

--and RIID=0 and TSOID=0 and ZIID=0

select * from payment where BankID=0
select * from payment where RIID=0 and TSOID=0 and ZIID=0 and HOID=0
select * from orderinfo where RIID=0 and TSOID=0 and ZIID=0 and HOID=0
select *,(select Customername from Customer where CustomerID=payment.CustomerID),
(select email from [user] where EmployeeID=payment.ziid) from payment where BankID=0

select * from [User] where EmployeeID=142


select *,(select email from [user] where EmployeeID=ZoneDetail.ZIID),
(select zonename from zone where zoneid=ZoneDetail.zoneid)  from ZoneDetail order by zoneid

select * from [capaymentviewapp] where paymentdate='2019-04-04'   and xorg like '%cocol
