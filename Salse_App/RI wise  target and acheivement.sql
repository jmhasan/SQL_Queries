--RI Wise Target and Achievement
with cte as
(select xdiv,xzone,xteam xemp,(select xempnew from opritargetdt where xyear=2020 and xper=10 and xemp=opchallandt.xteam) xempnew,
COUNT(distinct xrow) xrow,(select xqty from opritargetdt where xyear=2020 and xper=10 and xemp=opchallandt.xteam) xqty,
SUM(xqtychl)/20 xqtychl from opchallandt where xdatecom between  '2020-10-01' and '2020-10-26' 
and xdiv in ('Dhaka','Out Dhaka','Corporate') 
--and xzone in ('MYMENSINGH','NILPHAMARI') 
--and xrow not in (select xrow from opchallandt where xdatecom between  '2020-09-02' and '2020-09-13' and xdiv in ('Dhaka','Out Dhaka') )
group by xdiv,xzone,xteam 
union all 
select xsimcardno xdiv,xzone,xemp,xempnew,0 xrow,xqty,0 xqtychl from opritargetdt where xyear=2020 and xper=10 and 
xemp not in (select xteam from opchallan where xdatecom between  '2020-10-01' and '2020-10-26' and xdiv in ('Dhaka','Out Dhaka','Corporate') ))
select xdiv,xzone,xemp,
(select xname from prmst where xemp=cte.xemp and zid=100000) RIName,
(select xmobile1 from prmst where xemp=cte.xemp and zid=100000) RImobile,
xempnew,
(select xname from prmst where xemp=cte.xempnew and zid=100000) AIName,
(select xmobile1 from prmst where xemp=cte.xempnew and zid=100000) AImobile
,sum(xrow) No_of_Outlet,sum(xqty) xTarget,sum(xqtychl) Achievement from cte where
xzone in ('COMILLA','NARAYANGONJ','DHAKA NORTH') group by  xdiv,xzone,xemp,xempnew order by xzone

