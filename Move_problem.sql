select ztime,xvehicle,xlocate,xmaintstat,zactive,xgroups from vmvech where xvehicle like '%9218%'

select xmaxcap,xpostflag,xdate,xsornum,xvehicle,xdriver,(select xlocate from vmvech where zid=vmmovereg.zid and xvehicle=vmmovereg.xvehicle) Location,
xsdestin,xmovetype,xreviser,xintime,GETDATE() from vmmovereg where  xmovetype<>'In' and
xvehicle='BAGERHAT-SHA-11-0014'

select xmachnum,xsornum,xvehicle,xstatusmach,xsup,xname,xtype,xrate 
from opmachadv where xmachnum='PCMLDOAM1020-006233' or xmachnum='PCMLDOAM1020-006232'

select xvehicle,COUNT(xmovetype) from vmmovereg where xtype='DO Delivery' and xtypev='Vehicle' and xmovetype<>'In'
group by xvehicle having COUNT(xmovetype)>1

select  xsornum,xvehicle,xsdestin,xdestin from  vmmovereg where xsornum='PCMLMOVS1120-000006' 

select * from xcodes where xtype='Warehouse'

xmovetype='In',xreviser='"+#user+"',xdatein='"+#date+"',xintime='"+#time+"'

select * from vmmovereg where xtype='Rent' and xmovetype='Out' and xsdestin='PCML Factory'

select * from vmmoveregd where xsornum in ('PCMLMOV-0820-000896','PCMLMOV-0820-001245','PCMLMOV-0820-001246',
'PCMLMOV-0820-001247','PCMLMOV-0820-001491','PCMLMOV-0820-001248')

select xsornum,xvehicle, xsdestin,xmovetype,xdriver from  vmmovereg where xsornum='PCMLMOV-0720-006801'


select  xvehicle,xmaxload,xmaintstat,xlocate,zactive,xtypev,xlocate,xvhcat from vmvech where xvehicle not in (select xvehicle from vmmovereg where xmovetype<>'In')
and xtypev='Vehicle' and   xlocate<>'NCML-CTG' and xvehicle<>'Common' and zactive=1
 and xvhcat in ('BULK','COVER VAN','OPEN TRUCK') 
 
 select xvehicle,xmaintstat,xlocate,zactive,xtypev,xlocate,xvhcat
  from vmvech where xvehicle in ('DHAKA METRO U-11-3342')
  
 select * from vmmovereg where xmovetype<>'In' and xtype='DO Delivery' and xtypev='Vehicle'
 
 select xmaxload,COUNT(*) from vmvech  where  xtypev='Vehicle' and   xlocate<>'NCML-CTG'
 and xvhcat in ('BULK','COVER VAN','OPEN TRUCK') and zactive=1 group by xmaxload  
 
 select  xvehicle from vmmovereg where xvehicle='BAGERHAT-SHA-11-0008'  in (select  xvehicle from vmvech where zactive<1) and
 xtype='DO Delivery' and xtypev='Vehicle' and xconfirmt<'2020-06-01'
 
 -- Interruption check 
select xsornum,COUNT (distinct xstatus),COUNT(*),sum(case when xstatus='Released' then 1 else 0 end),
sum(case when xstatus='' then 1 else 0 end)  from vmmoveregd 
where xsornum in (select  xsornum from vmmanreq where xstatusreq='2-Approved')
group by xsornum  having sum(case when xstatus='' then 1 else 0 end)=0 

select * from vmmoveregd where xsornum='PCMLMOV-0820-004819'


select xsornum,xpostflag,xstatusmove,xintime,xmovetype from vmmovereg where xsornum='PCMLMOV-0820-004536'


select * from vmmanreq where xsrqnum='PCMLVREQ0820-001965'
select * from vmmoveregd where  xsrqnum='PCMLVREQ0820-001965'

select * from zxusers where zemail='al.amin2@premiercement.com'

select * from opadvice where dumzid='8087'