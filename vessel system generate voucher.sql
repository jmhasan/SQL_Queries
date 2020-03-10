select * from glheader where O

select * from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan)

select * from vmmovereg where xtypev='vessel' and xsec='Rent' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan)

select * from opchallan where xsornum in (select xsornum from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan))


select * from glheader where xref in (select xchlnum from opchallan where xsornum in (select xsornum from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan)))

select * from gldetail where xvoucher in (select xvoucher from glheader where xref in (select xchlnum from opchallan where xsornum in (select xsornum from vmmovereg where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO'
and xsornum in (select xsornum from opchallan))))

select h.xvoucher,h.xdate, h.xref,xprime,xacc,xvmcode,xsub,xbase from glheader h join gldetail d on h.zid=d.zid and h.xvoucher=d.xvoucher
 join opchallan c on h.zid=c.zid and h.xref=c.xchlnum where c.xsornum in (select xsornum from vmmovereg 
where xtypev='vessel' and xsec='Own' and xmovetype='In' and xtype='DO') and xyear=2018 and xper=10 
and xacc='321101010014' order by h.xvoucher


s