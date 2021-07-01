with xxx as(
 select xzone,(select max(xziid) from cacushrc where xzone=opchallandt.xzone) ZI,
 (select max(xtsoid) from cacushrc where xriid=opchallandt.xteam) AI,
 xteam,xqtychl from opchallandt where  xconfirmt between '2020-09-01 06:00:00.000' and  '2020-10-01 06:00:00.000'
 and xdiv not in('Corporate','Bag plant'))
 select xzone,ZI,(select xname from prmst where xemp=xxx.zi)ZIName,AI,(select xname from prmst where xemp=xxx.ai)AIName,xteam,
 (select xname from prmst where xemp=xxx.xteam)RIName,
 (select xqty from opritargetdt where xemp=xxx.xteam and xyear=2020 and xper=9) XTarget,
 SUM(xqtychl/20) Sales from xxx group by xzone,ZI,AI,xteam