--Osman vai requirement

 select h.xchlnum,d.xcus,dbo.cusname(h.xcus),h.xdelsite,m.xsornum,m.xvehicle,m.xmaxcap,h.xconfirmt,
m.xouttime,m.xintime,h.xdiv,h.xdelpoint Thana,h.xdestin DistributionPoint,
(select xdistrict from cadelpoint where xthana=h.xdelpoint) Distict from opchallan h join opchalland d on h.zid=d.zid 
and h.xchlnum=d.xchlnum join vmmovereg m on h.zid=m.zid and h.xsornum=m.xsornum and 
h.xdate between '2019-12-01' and '2020-01-30' and 
m.xsdestin='PCML Factory' and m.xtype='DO Delivery' and m.xtypev='Vehicle'
and h.xdiv in ('Dhaka','Sylhet') and m.xmaxcap in (10,20) 