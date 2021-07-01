with salesdo as (
select xcus,xorg,xzone,SUM(xqtychl) xqtychl from opchallandt where xconfirmt BETWEEN '2020-12-01 06:00' 
and '2020-12-17 06:00' group by xcus,xorg,xzone)
select xcus,xorg,xzone,xqtychl,(select sum(xqty-xqtychl) from opdorddt where xcus=salesdo.xcus) 
from salesdo

