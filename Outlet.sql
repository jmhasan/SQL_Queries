select ztime,xzone,xcus,dbo.cusname(xcus),xrow,xid,xoutletname,xriid,xziauth from 
caoutlet where xcus='CUS-003472' order by ztime desc