
select * from opchallan where xstatuschl='2-Confirmed'

select xchlnum,xstatuschl,xstatusdorr from opchallan where xchlnum in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849') --Previous Time
select * from  imtrn where xdocnum in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849')
select * from glheader where xref in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849')
select xsornum,xvehicle,xmovetype from vmmovereg where xsornum in (select xsornum from opchallan where xchlnum in ('PCMLCHL-0821-009729','PCMLCHL-0821-009848','PCMLCHL-0821-009849'))