select xmachnum,xadvnum,xdate,xchlnum,xsornum,xvehicle,xdestin,xdelpoint,xdelsite,xstatuschl,xconfirmt,xname,xdelivery,xstatusdorr,
xshipcode from opchallan where xchlnum ='PCMLCHL-1020-001795' or xchlnum='PCMLCHL-1020-001796'

select   xmachnum,xsornum,xvehicle,xstatusmach,xname,xsup,xtype from opmachadv where xmachnum='PCMLDOAM0820-003516'
select * from opadvice where xadvnum='PCMLDOA-0620-004660' 
select * from vmvech where xvehicle='DHAKA METRO U-11-4742'
select * from opchallan where xmachnum='PCMLDOAM0220-009149'



select xsornum,xvehicle,xrate,xdestin,xstatusmove,xmovetype,xtype,xdriver,(select xname from prmst where xemp=vmmovereg.xdriver),
xsup,dumzid,xtypev,xmaxcap,xmaxload,xsdestin,(select xorg from casup where zid=100000 and xsup=vmmovereg.xsup),
xglref from  vmmovereg where xsornum='PCMLMOV-0820-001404' or xsornum='PCMLMOV-0219-005739' or xsornum='PCMLMOV-0219-006025'

select xref,xvoucher,xacc,xsub,xdesc01,xvmcode,(select xorg from casup where zid=100000 and xsup=gldetail.xsub) from gldetail 
where xvoucher in (select xvoucher from glheader where  xref ='PCMLCHL-0820-005614' or xref ='PCMLCHL-0820-005614')

select xdate,xvoucher,xref,xlong,xnote,xdesc04,(select xorg from casup where zid=100000 and xsup=glheader.xdesc04),xdesc05 from glheader
 where xref ='PCMLCHL-0720-009226' or xref='PCMLMOV-0219-005739' or xref='PCMLMOV-0219-006025' 
 
select xmachnum,xsornum,xvehicle,xtype,xstatusmach,(select xdornum from opmachadviced where xmachnum=opmachadv.xmachnum) xdornum,
(select xqtymach from opmachadviced where xmachnum=opmachadv.xmachnum )xqtymach from opmachadv where
 xmachnum=(select xmachnum from opchallan where xchlnum='PCMLCHL-0720-009226')
 
 select xmachnum,xsornum,xvehicle,xdelivery,xstatusmach from opmachadv 
 where xmachnum in (select xmachnum from opchallan where xchlnum='PCMLCHL-0720-009226')


select xvehicle,xlocate,xmaintstat,xmaxload,xref from vmvech where xvehicle='DHAKA METRO U 11-2320'

select * from vmvech where xvehicle like '%4123%'

select * from vmrentset where xvehicle='DHAKA METRO-U-11-4743'


--for date time change of challan 
select xconfirmt from opchallan where xchlnum='PCMLCHL-1020-001795' or xchlnum='PCMLCHL-1020-001796'
 
select xdate from glheader where xref='PCMLCHL-1020-001795' or xref='PCMLCHL-1020-001796' 
select xdocnum,xtime,xdate from imtrn where xdocnum='PCMLCHL-1020-001795' or xdocnum='PCMLCHL-1020-001796'
select xconfirmt from vmmovereg where xsornum='PCMLMOV-1020-000299'
select xchallantime from opmachadviced where xmachnum='PCMLDOAM1020-000269'
select xchallantime from opadvice where xadvnum='PCMLDOA-0820-007100' or xadvnum='PCMLDOA-0820-007192'



select xsornum,xvehicle,xmovetype from vmmovereg where xvehicle='DHAKA METRO U-11-4155' and xmovetype <>'In'

select xmaintstat from vmvech where xvehicle='DHAKA METRO U-11-4155'

select * from opchallan where xsornum='PCMLMOV-0919-007657'

select * from opadvice where dumzid='28300'


select h.ztime,d.ximtor,h.xfwh,h.xtwh,d.xitem,d.xtbin,d.xqtyord,d.xunit,xstatustor  from imtdt d join imtor h on d.ximtor=h.ximtor 
where  xtwh='C & B(Faridpur) Ghat' and xstatustor='5-Completed' and h.ximtor='PCMLTO--0919-000383'


 and d.ximtor not in ( select xdocnum from imtrn )
 
  select * from imtrn where xdocnum='PCMLTO--0919-000383'
  

  