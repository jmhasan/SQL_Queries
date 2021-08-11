with salesdo as (
select xcus,xorg,xdiv,xzone,SUM(xqtychl) xqtychl from opchallandt where CONVERT(date,DATEADD(HOUR,-6,xconfirmt)) BETWEEN  '2021-08-01' and '2021-08-07' 
and xdiv in ('Dhaka','Out Dhaka') group by xcus,xorg,xdiv,xzone)
select xcus,xorg,xdiv,xzone,xqtychl,(select sum(xqty-xqtychl)  from opdorddt where xcus=salesdo.xcus) DO_Rem
from salesdo

