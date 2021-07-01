select xsornum from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan)

select * from vmmovereg where xtypev='vessel' and xsec='Rent' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan)

select xchlnum from opchallan where xsornum in 
(select xsornum from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan))

select xref,xvoucher,xacc,xsub,xvmcode,(select xorg from casup where zid=100000 and xsup=gldetail.xsub) from gldetail 
where xvoucher in (select xvoucher from glheader where  xref in (select xchlnum from opchallan where xsornum in 
(select xsornum from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan))))

select xdate,xvoucher,xref,xlong,xnote,xdesc04,(select xorg from casup where zid=100000 and xsup=glheader.xdesc04),xdesc05 from glheader
 where xref in (select xchlnum from opchallan where xsornum in 
(select xsornum from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan)))


