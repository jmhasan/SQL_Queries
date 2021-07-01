
----------Zone wise User ZI/AI/RI----------
select * from [User] where EmployeeID in (select ZIID from ZoneDetail where  ZoneID=47) 
select * from [User] where EmployeeID in (select TSOID from TerritoryDetail where TerritoryID in (select TerritoryID from Territory where ZoneID=46)) 
select * from [User] where EmployeeID in (select RIID from RouteDetailInfo where RouteID in (select RouteID from RouteInfo where TerritoryID in (select TerritoryID from Territory where ZoneID=46)))

-----------Zone Detail---------------
select * from Zone where  ZoneID=47
select *,(select Employeename from Employee where EmployeeID=ZoneDetail.ZIID),
(select email from [user] where EmployeeID=ZoneDetail.ZIID),
(select Password from [user] where EmployeeID=ZoneDetail.ZIID) from ZoneDetail where  ZoneID=15

select * from Territory where TerritoryID in (select TerritoryID from Territory where ZoneID=15)
select * from TerritoryDetail where TerritoryID in (select TerritoryID from Territory where ZoneID=15)

select * from RouteInfo where RouteID in (
select RouteID from RouteInfo where TerritoryID in (select TerritoryID from Territory where ZoneID=15))
select *  from RouteDetailInfo where RouteID in (
select RouteID from RouteInfo where TerritoryID in (select TerritoryID from Territory where ZoneID=15))
and RIID  not in (select EmployeeID from [User] where EmployeeID in (select RIID from RouteDetailInfo where RouteID in (select RouteID from RouteInfo where TerritoryID in (select TerritoryID from Territory where ZoneID=15))))

select *  from RouteDetailInfo where RouteID in (
select RouteID from RouteInfo where TerritoryID in (select TerritoryID from Territory where ZoneID=15))
and RIID   in (select EmployeeID from [User] where EmployeeID in (select RIID from RouteDetailInfo where RouteID in (select RouteID from RouteInfo where TerritoryID in (select TerritoryID from Territory where ZoneID=15))))


---------Terriroty Detail----------------
select * from Territory where TerritoryID =16

select *,(select TerritoryName from Territory where TerritoryID =16),(select Employeename from Employee where EmployeeID=TerritoryDetail.tsoid),
(select email from [user] where EmployeeID=TerritoryDetail.tsoid) from TerritoryDetail where TerritoryID =16

select * from RouteInfo where RouteID in (select RouteID from RouteInfo where TerritoryID= 16)

select *,(select Employeename from Employee where EmployeeID=RouteDetailInfo.RIID),
(select email from [user] where EmployeeID=RouteDetailInfo.RIID) from RouteDetailInfo where RouteID in (select RouteID from RouteInfo where TerritoryID =16)


select * from Employee where EmployeeID=68 or EmployeeID=265 or EmployeeID=266




select * from SalesPerson where CustomerID in (select CustomerID from Customer where CustomerCode in(
select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='MUNSHIGONJ'))



select * from Customer