
select * from RouteInfo where RouteID in (338,339,340,343,344,345,347,349,351,352)

select * from RouteDetailInfo where   RIID=527-- in (524,531,532,527,756,775,776)

select * from Territory where TerritoryID in (40,41,43,44)
select * from TerritoryDetail where TerritoryID in (40,41,43,44)

select * from Zone where ZoneID=50
select * from ZoneDetail where ZoneID=50

select * from SalesPerson where SalesPersonID=527
select * from Customer where CustomerID in (375,4987,10502,4157,11115,5052,2875)
select * from CustomerDetails where CustomerID in (375,4987,10502,4157,11115,5052,2875)

select * from Thana where ThanaID in(561,569,570,341,362,413,285,451,563,564)

select * from District where DistrictID in (
select DistrictID from Thana where ThanaID in(561,569,570,341,362,413,285,451,563,564)
)