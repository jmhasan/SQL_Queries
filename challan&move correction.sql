select xmachnum,xadvnum,xdate,xchlnum,xsornum,xvehicle,xdestin,xdelpoint,xdelsite,xstatuschl,xconfirmt,xname,xdelivery,xstatusdorr,
xshipcode from opchallan where xchlnum ='PCMLCHL-0320-001948' or xchlnum='PCMLCHL-0320-001949'

select   xsornum,xvehicle,xstatusmach from opmachadv where xmachnum='PCMLDOAM0320-001389' 
select * from vmvech where xvehicle='DHAKA METRO U-11-4742'
select * from opchallan where xmachnum='PCMLDOAM0320-000544'

select * from opmachadv where xsornum='PCMLMOV-0320-000577'



select xsornum,xvehicle,xrate,xdestin,xstatusmove,xmovetype,xtype,xdriver,(select xname from prmst where xemp=vmmovereg.xdriver),
xsup,dumzid,xtypev,xmaxcap,xmaxload,xsdestin,(select xorg from casup where zid=100000 and xsup=vmmovereg.xsup),
xglref from  vmmovereg where xsornum='PCMLMOV-0320-000874' or xsornum='PCMLMOV-0219-005739' or xsornum='PCMLMOV-0219-006025'

select xref,xvoucher,xacc,xsub,xdesc01,xvmcode,(select xorg from casup where zid=100000 and xsup=gldetail.xsub) from gldetail 
where xvoucher in (select xvoucher from glheader where  xref ='PCMLCHL-0320-001948' or xref='PCMLCHL-0320-001949'
 or xref='PCMLssCHL-1219-008600')

select xdate,xvoucher,xref,xlong,xnote,xdesc04,(select xorg from casup where zid=100000 and xsup=glheader.xdesc04),xdesc05 from glheader
 where xref ='PCMLCHL-1219-008598' or xref='PCMLMOV-0219-005739' or xref='PCMLMOV-0219-006025' 
 
select xmachnum,xsornum,xvehicle,xtype,xstatusmach,(select xdornum from opmachadviced where xmachnum=opmachadv.xmachnum) xdornum,
(select xqtymach from opmachadviced where xmachnum=opmachadv.xmachnum )xqtymach from opmachadv where
 xmachnum=(select xmachnum from opchallan where xchlnum='PCMLCHL-0919-000034')
 
 select xmachnum,xsornum,xvehicle,xdelivery,xstatusmach from opmachadv 
 where xmachnum in (select xmachnum from opchallan where xchlnum='PCMLCHL-0919-005195')


select xvehicle,xlocate,xmaintstat,xmaxload,xref from vmvech where xvehicle='DHAKA METRO U 11-2320'

select * from vmvech where xvehicle like '%4573%'

select * from vmrentset where xvehicle='DHAKA METRO-U-11-4743'


--for date time change of challan 
select xconfirmt from opchallan where xchlnum='PCMLCHL-0220-003431' or xchlnum='PCMLCHL-0220-003432'
 
select xdate from glheader where xref='PCMLCHL-0220-003431' or xref='PCMLCHL-0220-003432' 
select xdocnum,xtime,xdate from imtrn where xdocnum='PCMLCHL-0220-003431' or xdocnum='PCMLCHL-0220-003432'
 
select xchallantime from opmachadviced where xmachnum='PCMLDOAM0220-002485'
select xchallantime from opadvice where xadvnum='PCMLDOA-0220-003613' or xadvnum='PCMLDOA-0220-003614'



select xsornum,xvehicle,xmovetype from vmmovereg where xvehicle='DHAKA METRO U-11-4573' and xmovetype <>'In'

select * from opchallan where xsornum='PCMLMOV-0919-007657'


select h.ztime,d.ximtor,h.xfwh,h.xtwh,d.xitem,d.xtbin,d.xqtyord,d.xunit,xstatustor  from imtdt d join imtor h on d.ximtor=h.ximtor 
where  xtwh='C & B(Faridpur) Ghat' and xstatustor='5-Completed' and h.ximtor='PCMLTO--0919-000383'


 and d.ximtor not in ( select xdocnum from imtrn )
 
  select * from imtrn where xdocnum='PCMLTO--0919-000383'
  
  