select * from RouteDetailInfo where RIID=130
select * from RouteInfo where RouteID=72

select * from Territory where TerritoryID=72
select * from TerritoryDetail where TerritoryID=72

select * from Zone where ZoneID=3
select * from ZoneDetail where ZoneID=3

select * from vAllCustomerEmployee where ZoneName='COMILLA' or ZoneName='CHITTAGONG'

SELECT distinct  dbo.Territory.ZoneID, dbo.Zone.ZoneName, dbo.ZoneDetail.ZIID, dbo.RouteInfo.TerritoryID, dbo.Territory.TerritoryName, dbo.TerritoryDetail.TSOID, dbo.RouteDetailInfo.RouteID, 
                      dbo.RouteInfo.RouteName, dbo.SalesPerson.CustomerID, dbo.Customer.CustomerName, dbo.SalesPerson.SalesPersonID, dbo.Employee.EmployeeName, dbo.Customer.CustomerCode, 
                      dbo.Customer.Address, dbo.Customer.Mobile, dbo.Customer.CustomerTypeID, dbo.Customer.DealerID, dbo.Customer.FreeBag, dbo.Customer.SecurityAmount, dbo.Customer.Email, 
                      dbo.Customer.CreatedAt, dbo.Customer.UserID
FROM         dbo.TerritoryDetail INNER JOIN
                      dbo.RouteDetailInfo INNER JOIN
                      dbo.Territory INNER JOIN
                      dbo.RouteInfo ON dbo.Territory.TerritoryID = dbo.RouteInfo.TerritoryID ON dbo.RouteDetailInfo.RouteID = dbo.RouteInfo.RouteID INNER JOIN
                      dbo.Zone ON dbo.Territory.ZoneID = dbo.Zone.ZoneID ON dbo.TerritoryDetail.TerritoryID = dbo.Territory.TerritoryID INNER JOIN
                      dbo.ZoneDetail ON dbo.Zone.ZoneID = dbo.ZoneDetail.ZoneID INNER JOIN
                      dbo.Customer ON dbo.RouteInfo.RouteID = dbo.Customer.RouteID INNER JOIN
                      dbo.SalesPerson ON dbo.Customer.CustomerID = dbo.SalesPerson.CustomerID INNER JOIN
                      dbo.Employee ON dbo.SalesPerson.SalesPersonID = dbo.Employee.EmployeeID

select *,(select CustomerCode from Customer where CustomerID=SalesPerson.CustomerID),
(select xorg from erp200.ERPonTheNet.dbo.cacus where xcus=((select CustomerCode from Customer 
where CustomerID=SalesPerson.CustomerID))),
(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus where xcus=((select CustomerCode from Customer 
where CustomerID=SalesPerson.CustomerID))) from SalesPerson where  Customerid in (
select Customerid from  customer where customercode in (select xcus from erp200.ERPonTheNet.dbo.cacus 
where xbloodgrp='DHAKA NORTH -2' or xbloodgrp='DHAKA SOUTH -1'))