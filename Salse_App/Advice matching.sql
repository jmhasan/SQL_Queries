select ztime,zutime,xadvnum,xvehicle,dumzid,xwh,xcus,xdornum,xqtysms,xqty,xqtychl,xqtycut,xdelivery,xsmstypecat,xstatusadvmach
 from opadvice where  ztime>'2019-09-17 10:00:00.000' and xdelivery='Customer' order by ztime desc
 
select ztime,xmachnum,xwh,xcus,xdelivery,xtype,xsornum,xvehicle,xsup,xname,xrate,xstatusmach
 from opmachadv where ztime>'2019-09-17 10:00:00.000' and xdelivery='Customer' order by ztime desc
 
select xmachnum,xdornum,xtypecat,xlocbag,(select xtypecat from opdorddt where xdornum=opmachadviced.xdornum),
xqtysms,xqtycrn,xqtymach,xrate,xdtwotax,xdttax,xlineamt,xchgdel,xchgtot,
 xtypeloc,xdelivery,(select xstatusmach from opmachadv where xmachnum=opmachadviced.xmachnum)
  from opmachadviced where zutime>'2019-09-17 10:00:00.000' and xdelivery<>'Company'and xtypecat<>xlocbag

select xchlnum,xsornum,xvehicle,xname,(select xtype from vmmovereg where xsornum=opchallan.xsornum ) from opchallan where
xmachnum  in (select xmachnum from opmachadv where ztime>'2019-09-17 10:00:00.000')  

select xchlnum,xstatuschl,xsornum,xname,xvehicle,xdelivery from opchallan where xchlnum='PCMLCHL-0919-007089'

select xsornum,xvehicle,xsup,(select xorg from casup where xsup=vmmovereg.xsup)
 from vmmovereg where xsornum='PCMLMOV-0919-004518'
 
 select xmachnum,xwh from opmachadviced where xmachnum='PCMLDOAM0919-001450'
 select count(xline) from opmachadviced where xmachnum='PCMLDOAM0919-001450'
 
 select xchgdel from cacustrrate where xwh='FINISHED GOODS' and xthana='Ishwardi Pabna'
  select xchgdel from cacustrrate where xwh='FINISHED GOODS' and xthana='Pabna'
 
 select xdornum,xwh,xdelpoint,xchgdel from opddt where xdornum='PCMLDO--0919-001549'


select xsornum,xvehicle,xmovetype,xtypev,xtype,xdestin,xsdestin
 from vmmovereg where xsornum='PCMLMOV-0919-004021'
 
 select xmachnum,xtypecat,xlocbag,xdornum,(select xtypecat from opddt where xdornum=opmachadviced.xdornum)
  from opmachadviced where xmachnum='PCMLDOAM0919-001637'
  
  select * from opchallan where xmachnum<>'' and xdelivery='Customer'
  