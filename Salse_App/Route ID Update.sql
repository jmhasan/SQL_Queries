select CustomerCode,CustomerName,
(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus where zid=100000 and xcus=Customer.CustomerCode ),
(select zoneid from Zone where ZoneName=(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus 
 where zid=100000 and xcus=Customer.CustomerCode)),
 (select min(TerritoryID) from Territory where Zoneid=(select zoneid from Zone where ZoneName=(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus 
 where zid=100000 and xcus=Customer.CustomerCode))),
 (select min(Routeid) from RouteInfo where TerritoryID=
  (select min(TerritoryID) from Territory where Zoneid=(select zoneid from Zone where ZoneName=(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus 
 where zid=100000 and xcus=Customer.CustomerCode)))),RouteID from Customer 
 
 select CustomerCode,CustomerName,
(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus where zid=100000 and xcus=Customer.CustomerCode )
,RouteID,(select zonename from Zone where ZoneID=(select ZoneID from Territory
 where TerritoryID=(select TerritoryID from RouteInfo where RouteID=Customer.RouteID))) from Customer 