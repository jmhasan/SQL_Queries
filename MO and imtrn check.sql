select xdatemo,xmoord,xqtyprd,xitem,xwh from moord where xdatemo between '2019-03-01' 
and '2019-03-31' and xstatusmor= '5-Completed' and xmoord not in 
(select xdocnum  from imtrn where xdate between '2019-03-01' 
and '2019-03-31' and xdoctype='MO--')



select xdate,xdocnum,xqty,(select xdatemo from moord where xmoord=imtrn.xdocnum) MODate  from imtrn where xdate between '2019-03-01' 
and '2019-03-31' and xdoctype='MO--' and xdocnum not in (select xmoord from moord where xdatemo between '2019-03-01' 
and '2019-03-31' and xstatusmor= '5-Completed' and xwh='FINISHED GOODS') and  xwh='FINISHED GOODS'