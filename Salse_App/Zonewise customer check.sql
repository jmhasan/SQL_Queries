select * from erp200.ERPonTheNet.dbo.cacus where xbloodgrp='DHAKA MIDDLE'  
and xcus  in (select distinct  CustomerCode from RouteInfo rh join RouteDetailInfo rd on rh.routeid=rd.RouteID 
join Territory th on rh.TerritoryID=th.TerritoryID join TerritoryDetail td on th.TerritoryID=td.TerritoryID 
join Zone zh on th.ZoneID=zh.ZoneID join ZoneDetail zd on zh.ZoneID=zd.ZoneID join SalesPerson s on s.SalesPersonID=rd.RIID
join Customer c on c.CustomerID=s.CustomerID where zh.Zonename='DHAKA MIDDLE')


select * from [user] where Email='trade.faridpur@premiercement.com'

select xbloodgrp from erp200.ERPonTheNet.dbo.cacus

select CustomerID,CustomerCode,CustomerName,(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus where xcus=Customer.CustomerCode),
CustomerName+' - '+(select xbloodgrp from erp200.ERPonTheNet.dbo.cacus where xcus=Customer.CustomerCode) from Customer
