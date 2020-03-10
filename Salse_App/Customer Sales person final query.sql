create view vAllCusSP as
select  zh.ZoneID,zh.Zonename,zd.ZIID ,dbo.empname(zd.ZIID) "ZI_Name",
rh.TerritoryID,th.TerritoryName,td.TSOID,dbo.empname(td.TSOID) "TSO_Name",rh.RouteID,rh.RouteName,
s.CustomerID,c.CustomerName,rd.RIID ,dbo.empname(rd.RIID) "RI_Name",c.CustomerCode,
c.Address, c.Mobile, c.CustomerTypeID, c.DealerID, c.FreeBag, c.SecurityAmount, c.Email, 
c.CreatedAt, c.UserID from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID
join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID
--where zh.ZoneID=3 or  zh.ZoneID=4
select * from vAllCusSP where CustomerID=4811
select ZoneID,Zonename,ZIID ,ZI_Name,
TerritoryID,TerritoryName,TSOID,TSO_Name,RouteID,RouteName,
CustomerID,CustomerName,RIID,RI_Name,CustomerCode,COUNT(*) from vAllCusSP where ZoneID=3 or  ZoneID=4
group by ZoneID,Zonename,ZIID ,ZI_Name,
TerritoryID,TerritoryName,TSOID,TSO_Name,RouteID,RouteName,
CustomerID,CustomerName,RIID,RI_Name,CustomerCode

select * from RouteInfo where  TerritoryID in ( select TerritoryID from Territory where ZoneID=3 or  ZoneID=4)
select * from RouteDetailInfo where  RouteID in (select RouteID from RouteInfo where  TerritoryID in ( select TerritoryID from Territory where ZoneID=3 or  ZoneID=4))

select * from RouteDetailInfo where RIID=62 or RIID=53

select * from Territory where  ZoneID=3 or  ZoneID=4
select * from TerritoryDetail where TerritoryID in ( select TerritoryID from Territory where ZoneID=3 or  ZoneID=4)

select * from Customer


CREATE FUNCTION [dbo].[empname](
   @empid varchar(100) )
 RETURNS VARCHAR(100)
 AS
 BEGIN
   DECLARE @empname VARCHAR(100) = (SELECT EmployeeName
                     FROM Employee
                     WHERE  EmployeeID= @empid)
   RETURN @empname

 END
 

GO

select * from Employee