--Check Missing Customer
select * from erp200.ERPonTheNet.dbo.cacus where xcus not in (select customercode from Customer)

select xbloodgrp,count(*),( select count(distinct  CustomerCode) from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID where zh.Zonename=cacus.xbloodgrp) from erp200.ERPonTheNet.dbo.cacus 
where xstatuscus='1-Open'
group by xbloodgrp having count(*)<>( select count(distinct  CustomerCode) from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID where zh.Zonename=cacus.xbloodgrp)
----
select * from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID where zh.Zonename='RETAILER'  -- Sales app Customer

--- ERP and Slaes Apps customer cross check Zone wise
select * from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='FARIDPUR'  
and xcus  in (select distinct  CustomerCode from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID where zh.Zonename='FARIDPUR')

select zh.ZoneID,(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus where 
xcus=c.CustomerCode),zh.Zonename,zd.ZIID ,dbo.empname(zd.ZIID) "zonal incharge name",
rh.TerritoryID,th.TerritoryName,td.TSOID,rh.RouteID,rh.RouteName,
s.CustomerID,c.CustomerName,rd.RIID SalesPersonID ,dbo.empname(rd.RIID) "EmployeeName",c.CustomerCode,
c.Address, c.Mobile, c.CustomerTypeID, c.DealerID, c.FreeBag, c.SecurityAmount, c.Email, 
c.CreatedAt, c.UserID from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID
join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID
where zh.Zonename='FARIDPUR'  and
(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus where xcus=c.CustomerCode)<>'FARIDPUR' and zd.ZIID=41

--- ZIID wise Zonal Incharge 
select *,(select zonename from Zone where ZoneID=ZoneDetail.ZoneID),(select email from Employee where EmployeeID=ZoneDetail.ZIID) 
from ZoneDetail where ZIID=155 
--Zone wise ZIID
select *,(select zonename from Zone where ZoneID=ZoneDetail.ZoneID),(select email from Employee where EmployeeID=ZoneDetail.ZIID) 
from ZoneDetail where ZoneID  in (select ZoneID from zone where ZoneName='FARIDPUR' )
 
 --Check Customer ZIID wise
select  distinct CustomerCode from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID where zd.ZIID=155

---Check Customer zone wise
select  distinct CustomerCode from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID where zh.Zonename='FARIDPUR'  -- Sales app Customer

select * from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='RETAILER'  -- ERP CUSTOMER 

--insert into SalesPerson
select (select MAX(SysSalesPersonID)from SalesPerson)+ROW_NUMBER() OVER(ORDER BY customerid ASC) AS Row#,customerid,64,'True' from Customer 
where CustomerCode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='FARIDPUR') 
and CustomerID not in (select CustomerID from SalesPerson)

select * from Territory where ZoneID=4
--insert into SalesPerson
select ROW_NUMBER() OVER(ORDER BY customerid ASC) AS Row#,customerid,29,'True' from Customer 
where CustomerCode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='DHAKA NORTH') order by CustomerCode

select * from SalesPerson where CustomerID
in (select CustomerID from Customer 
where CustomerCode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='DHAKA SOUTH') ) 

select * from RouteDetailInfo where  RouteID in (select RouteID from RouteInfo where  TerritoryID in ( select TerritoryID from Territory where ZoneID=5))

select * from RouteDetailInfo where RIID IN(16,20) or RIID=66
select * from Zone where ZoneID in(
select * from Territory where TerritoryID in (select TerritoryID from RouteInfo where RouteID in (select RouteID from RouteDetailInfo where RIID=16 or RIID=20)))

select * from RouteInfo where RouteID in (select RouteID from RouteDetailInfo where RIID=16 or RIID=20)

select * from Territory where TerritoryID in (
select TerritoryID from RouteInfo where RouteID in (select RouteID from RouteDetailInfo where RIID=16 or RIID=66))

select *,(select TerritoryName from Territory where TerritoryID=TerritoryDetail.TerritoryID)from TerritoryDetail where TerritoryID in (
select TerritoryID from Territory where TerritoryID in (
select TerritoryID from RouteInfo where RouteID in (select RouteID from RouteDetailInfo where RIID=50 or RIID=145 or RIID=148)))

select *,(select email from [User] where EmployeeID=ZoneDetail.ZIID ),
(select Password from [User] where EmployeeID=ZoneDetail.ZIID ) from zonedetail where ZoneID=7

select * from Territory where TerritoryID=18

select * from SalesPerson where SalesPersonID=172 and CustomerID=19

delete from SalesPerson where SalesPersonID=191 and CustomerID=4149

 
select * from zone where ZoneName in 
(select  xbloodgrp  from erp200.ERPonTheNet.dbo.cacus where xsimcardno='Dhaka' or xsimcardno='Out Dhaka')
and ZoneID not in (select ZoneID from ZoneDetail where ZIID=146)


select * from Zone where zii=146
select * from [user] where  EmployeeID in (select ZIID from ZoneDetail where ZoneID=146)

select * from [user] where  EmployeeID=146