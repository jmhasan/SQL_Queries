
select * from RouteInfo where RouteID in (41,347,348,349,350)

select distinct RouteID from RouteDetailInfo where   RIID=530-- in (524,531,532,527,756,775,776)

select * from Territory where TerritoryID=41 in (40,41,43,44)
select * from TerritoryDetail where TerritoryID=41 in (40,41,43,44)

select * from Zone where ZoneID=4
select * from ZoneDetail where ZoneID=4 --502

select * from SalesPerson where SalesPersonID=527
select * from Customer where CustomerID in (375,4987,10502,4157,11115,5052,2875)
select * from CustomerDetails where CustomerID in (375,4987,10502,4157,11115,5052,2875)

select * from Thana where ThanaID in(561,569,570,341,362,413,285,451,563,564)

select * from District where DistrictID in (
select DistrictID from Thana where ThanaID in(561,569,570,341,362,413,285,451,563,564)
)