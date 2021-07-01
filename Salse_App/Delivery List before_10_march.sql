with xyz as (

select xcus,xorg,xzone,sum(xqtychl/20) totxqtychl
from opchallandt where xdatecom BETWEEN '2021-03-01' and '2021-03-31' and  xdiv<>'Bag Plant' and xstatuschl='3-Invoiced' 
group by xcus,xorg,xzone)

select xcus,xorg,xzone,totxqtychl,
(select sum(xqtychl/20) from opchallandt where xdatecom BETWEEN '2021-03-01' and '2021-03-31' and xdiv<>'Bag Plant' and xstatuschl='3-Invoiced' and 
 xcus=xyz.xcus and xdornum in (select xdornum from opdorddt where xconfirmt<='2021-03-10 06:00')) before10 from  xyz 



