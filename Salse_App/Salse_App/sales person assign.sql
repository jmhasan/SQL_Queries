
select * from RouteInfo where territoryid in (select territoryid from Territory where ZoneID=4)

select * from Territory where ZoneID=4
--insert into SalesPerson
select 28+ROW_NUMBER() OVER(ORDER BY customerid ASC) AS Row#,customerid,29,'True' from Customer 
where CustomerCode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='DHAKA NORTH') order by CustomerCode

select * from opdorvw where xdate='2018-05-13' and xzone='COMILLA'

select * from opdelvw where xdate='2018-05-09' and xzone='COMILLA' order by xcus

select zid,xemp,xname,xlocation,xdept,xdesig,xempcat,xsex,xreligi,xcitizen,xstatusemp from  erp200.ERPonTheNet.dbo.prmst 
where xdept='Marketing & sales' and xstatusemp='A-Active'

select * from Customer 
where CustomerCode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='DHAKA NORTH')

select * from SalesPerson where CustomerID
in (select CustomerID from Customer 
where CustomerCode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='COMILLA') ) 

select * from RouteInfo where  TerritoryID in ( select TerritoryID from Territory where ZoneID=6)
select * from RouteDetailInfo where  RouteID in (select RouteID from RouteInfo where  TerritoryID in ( select TerritoryID from Territory where ZoneID=6))

select * from RouteDetailInfo where RIID=62 or RIID=53

select * from Territory where ZoneID=6
select * from TerritoryDetail where TerritoryID in ( select TerritoryID from Territory where ZoneID=6)

select * from Zone where ZoneID=6

select * from ZoneDetail where ZoneID=6

select * from [User] where EmployeeID=29 or EmployeeID=62
select * from SalesPerson where  Customerid in (
select Customerid from  customer where customercode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='COMILLA'))

select * from SalesPerson where SalesPersonID=53
and CustomerID not in (
select Customerid from  customer where customercode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='COMILLA'))

select * from Employee
