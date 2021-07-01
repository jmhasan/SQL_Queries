select xzone,xcus,xorg,xtypecat,sum(xqtychl) xqtychl,sum(xqtychl*xrate) amount from opchallandt where xconfirmt between '2020-11-01 06:00' and '2020-12-01 06:00' 
and xdiv='Corporate' and xtypecat like '%Bulk%'
group by xzone,xcus,xorg,xtypecat order by xcus 