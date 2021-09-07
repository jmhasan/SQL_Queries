
select * from opchallan where xstatuschl='2-Confirmed'

select xchlnum,xsornum,xstatuschl,xstatusdorr from opchallan where xchlnum ='PCMLCHL-0921-001388' --in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849') --Previous Time
select * from  imtrn where xdocnum ='PCMLCHL-0921-001388' --in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849')
select * from glheader where xref ='PCMLCHL-0921-001388' --in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849')
select xsornum,xvehicle,xmovetype from vmmovereg where xsornum in (select xsornum from opchallan where xchlnum in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849'))