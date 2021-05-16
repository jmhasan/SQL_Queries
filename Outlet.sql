select ztime,xzone,xcus,dbo.cusname(xcus),xrow,xid,xoutletname,xriid,(select xname from prmst where xemp=caoutlet.xriid) xname,xziauth from 
caoutlet where xcus='CUS-001744' order by ztime desc

