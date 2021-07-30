DECLARE @fxdate AS date
DECLARE @txdate AS date
DECLARE @xyear as int
DECLARE @xper as int
SET @fxdate = '2021-07-01'
SET @txdate = '2021-07-29'
set @xyear=2021
set @xper=07;

with cte as 
(select xdiv,xzone,xteam xemp,(select xempnew from opritargetdt where xyear=@xyear and xper=@xper and xemp=opchallandt.xteam) xempnew, 
COUNT(distinct xrow) xrow,(select xqty from opritargetdt where xyear=@xyear and xper=@xper and xemp=opchallandt.xteam) xqty, 
SUM(xqtychl)/20 xqtychl from opchallandt where xdatecom between @fxdate and @txdate 
and xdiv in ('Dhaka','Out Dhaka','Corporate') 
--and xzone in ('MYMENSINGH','NILPHAMARI') 
--and xrow not in (select xrow from opchallandt where xdatecom between '2020-09-02' and '2020-09-13' and xdiv in ('Dhaka','Out Dhaka') ) 
group by xdiv,xzone,xteam 
union all 
select xsimcardno xdiv,xzone,xemp,xempnew,0 xrow,xqty,0 xqtychl from opritargetdt where xyear=@xyear and xper=@xper and 
xemp not in (select xteam from opchallan where xdatecom between @fxdate and @txdate and xdiv in ('Dhaka','Out Dhaka','Corporate') )) 
select xdiv Division,xzone Zone,xempnew AI_Code, 
(select xname from prmst where xemp=cte.xempnew and zid=100000) AI_Name, 
(select xmobile1 from prmst where xemp=cte.xempnew and zid=100000) AI_Mobile, 
sum(xrow) No_of_Outlet,sum(xqty) AI_Target,sum(xqtychl) AI_Achievement from cte 
group by xdiv,xzone,xempnew