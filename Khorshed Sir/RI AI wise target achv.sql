with cte as
(select xdiv,xzone,xteam xemp,(select xempnew from opritargetdt where xyear=2020 and xper=11 and xemp=opchallandt.xteam) xempnew,
COUNT(distinct xrow) xrow,(select xqty from opritargetdt where xyear=2020 and xper=11 and xemp=opchallandt.xteam) xqty,
SUM(xqtychl)/20 xqtychl from opchallandt where xdatecom between  '2020-11-01' and '2020-11-16' 
and xdiv in ('Dhaka','Out Dhaka','Corporate') 
--and xzone in ('MYMENSINGH','NILPHAMARI') 
--and xrow not in (select xrow from opchallandt where xdatecom between  '2020-09-02' and '2020-09-13' and xdiv in ('Dhaka','Out Dhaka') )
group by xdiv,xzone,xteam 
union all 
select xsimcardno xdiv,xzone,xemp,xempnew,0 xrow,xqty,0 xqtychl from opritargetdt where xyear=2020 and xper=11 and 
xemp not in (select xteam from opchallan where xdatecom between  '2020-11-01' and '2020-11-16' and xdiv in ('Dhaka','Out Dhaka','Corporate') ))
select xdiv,xzone,xemp,(select xname from prmst where xemp=cte.xemp and zid=100000),
(select xmobile1 from prmst where xemp=cte.xemp and zid=100000),xempnew,
(select xname from prmst where xemp=cte.xempnew and zid=100000),
sum(xrow),sum(xqty),sum(xqtychl) from cte where xdiv in ('Dhaka','Out Dhaka')
group by  xdiv,xzone,xemp,xempnew