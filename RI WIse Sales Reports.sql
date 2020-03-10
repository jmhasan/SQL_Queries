 with xxx as(
 select xzone,(select max(xziid) from cacushrc where xzone=opchallandt.xzone) ZI,
 (select xtsoid from cacushrc where xriid=opchallandt.xteam) AI,
 xteam,xqtychl from opchallandt where  xconfirmt between '2020-03-01 06:00:00.000' and  '2020-03-04 06:00:00.000'
 and xdiv not in('Corporate','Bag plant'))
 select xzone,ZI,(select xname from prmst where xemp=xxx.zi)ZIName,AI,(select xname from prmst where xemp=xxx.ai)AIName,xteam,
 (select xname from prmst where xemp=xxx.xteam)RIName,SUM(xqtychl/20) from xxx group by xzone,ZI,AI,xteam