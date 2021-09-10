--Customer Wise Target achev

DECLARE @fxdate AS date
DECLARE @txdate AS date
SET @fxdate = '2021-09-01'
SET @txdate = '2021-09-08';

with custarget (xcus,xorg,xzone,xqty,tillsales) as(
select t.xcus,c.xorg,c.xbloodgrp,sum(t.xqty/20) xqty,
(select sum(xqtychl/20) from opchallandt where xcus=t.xcus and xstatuschl='3-Invoiced'
 and xdatecom between @fxdate and @txdate ) tillsales 

 from cacomslab t join cacus c on t.zid=c.zid and t.xcus=c.xcus where xtype='Realistic Commission'
group by t.xcus,c.xorg,c.xbloodgrp )

select xzone,xcus Cus_Code,xorg Cus_Name,sum(xqty) target_qty ,sum(tillsales) tillsales,sum(xqty/DAY(EOMONTH(@txdate)))*DAY(GETDATE()) tilldatetarget,
sum(tillsales*100/xqty) Achievement_percent,  
(select sum(xqty-xqtychl)/20  from opdor h join opddt 
d on h.zid=d.zid and h.xdornum=d.xdornum where h.xcus=custarget.xcus and xstatusdor<>'C-Cancelled' and xdate<=@txdate) DORemaining
from  custarget   GROUP by  xzone,xcus,xorg   

