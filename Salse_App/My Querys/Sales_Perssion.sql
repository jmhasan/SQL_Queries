select d.EmployeeCode,EmployeeName,d.EmployeeID,d.DesignationID,h.Email,h.[Password]
 from  [user] h join Employee d on h.EmployeeID=d.EmployeeID  where 
 d.EmployeeCode in ('003674') --  003654  002100
 
select * from Employee where EmployeeID=808 
select * from [user] where  Email='003674@premiercement.com'

select h.TerritoryID,h.RouteID,h.RouteName,d.RIID,IsVoid from RouteInfo  h join RouteDetailInfo d on h.RouteID=d.RouteID
where d.RIID in (527)

select * from Territory h join TerritoryDetail d on h.TerritoryID=d.TerritoryID 
where h.TerritoryID=44-- d.TSOID='764'

select * from Zone h join ZoneDetail d on h.ZoneID=d.ZoneID where h.ZoneID=4

select * from OrderInfo where RIID=359 order by CreatedAt desc



select * from [User] where Email like '%Corporate%'
select * from Employee where EmployeeID=359

select * from Zone where ZoneID=21

select * from Customer where  CustomerID=10456
select * from Customer where CustomerCode='CUS-005998'

select * from CustomerDetails where CustomerID=2379

select * from SalesPerson where SalesPersonID=250
select * from SalesPerson where SalesPersonID=250

select * from vSalesPerson where EmpID='359'

