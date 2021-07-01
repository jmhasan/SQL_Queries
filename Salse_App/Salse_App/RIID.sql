--insert into SalesPerson
select 28+ROW_NUMBER() OVER(ORDER BY customerid ASC) AS Row#,customerid,29,'True' from Customer 
where CustomerCode in (select xcus from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='DHAKA NORTH') order by CustomerCode


select * from RouteInfo where  TerritoryID in ( select TerritoryID from Territory where ZoneID=2)
select * from RouteDetailInfo where  RouteID in (select RouteID from RouteInfo where  TerritoryID in ( select TerritoryID from Territory where ZoneID=2))

select * from Territory where ZoneID=2
select * from TerritoryDetail where TerritoryID in ( select TerritoryID from Territory where ZoneID=2)

select * from Zone where ZoneID=6

select * from ZoneDetail where ZoneID=6
