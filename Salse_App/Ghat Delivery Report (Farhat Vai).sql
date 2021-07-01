
with abc as (
select xcus,xorg,xwh,xzone,(select max(xziid) from cacushrc where xzone=opchallandt.xzone) ziid,xchlnum,xqtychl,xadvnum,xdelpoint,xdiv,
(select ztime from opadvice where xadvnum=opchallandt.xadvnum) advice_create_time,
(select xconfirmt from opadvice where xadvnum=opchallandt.xadvnum) advice_confirm_time,xconfirmt,xsornum,xvehicle,xstatuschl,
(select trkm from vmmovereg where xsornum=opchallandt.xsornum ) trkm
from opchallandt	where xconfirmt between '2020-08-01 06:00' and '2020-11-14 06:00' and 
xwh<>'FINISHED GOODS' and xdiv<>'Bag Plant' and xdelivery='Company' and xtype='Own' and xstatuschl='3-Invoiced')

select xcus,xorg,xwh,xzone,ziid,(select xname from prmst where xemp=abc.ziid),xchlnum,
xqtychl,xadvnum,xdelpoint,xdiv,advice_create_time,advice_confirm_time,
xconfirmt,xsornum,xvehicle,trkm from abc order by xwh
