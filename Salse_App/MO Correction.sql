select xdatemo,xmoord,xqtyprd,xitem,xwh from moord where xdatemo between '2019-03-01 06:00:00.000' 
and '2019-03-31 00:00:00.000' and xstatusmor= '5-Completed'
 and xmoord not in (select xdocnum from imtrn where xdate between '2019-03-01 00:00:00.000' 
 and '2019-03-31 00:00:00.000' and xdoctype='MO--')
select xdocnum,SUM(xqty*xsign) from imtrn where xdocnum in(
select xmoord from moord where xdatemo between '2019-03-01 00:00:00.000' 
and '2019-03-31 00:00:00.000' and xstatusmor= '5-Completed')  group by xdocnum 
having SUM(xqty*xsign)>0 and xwh=''
and xaction='issue' --783337.889395
select xdate,xdocnum,xitem,xwh,xqty  from imtrn where xdate between '2019-03-01' and '2019-03-31' and xdoctype='MO--'
and xdocnum  not in (select xmoord from moord where xdatemo between '2019-03-01' 
and '2019-03-31' and xstatusmor= '5-Completed' group by xmoord) and xwh='FINISHED GOODS'
select * from moodt where xmoord in (select xmoord from moord where xconfirmt between '2019-03-01 06:00:00.000'
 and '2019-03-31 06:00:00.000' )


select xdatemo from  moord where xmoord='PCMLMO--0519-000038'
select xdocnum,ximtrnnum,xitem,xwh,xqty,xdate,xdateexp,xdaterec from imtrn where xdocnum='PCMLMO--0519-000038'


select * from glheader where xref='PCMLMO--0119-000001'
select * from gldetail where xref='PCMLMO--0119-000001'


