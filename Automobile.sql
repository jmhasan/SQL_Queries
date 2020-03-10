select d.xitem,xdesc,xunit,sum(m.xval)/sum(d.xqtyreq) Rate,sum(d.xqtyreq) qty,
sum(m.xval) value from imtemptrn h join imtemptdt d on h.zid=d.zid and h.ximtmptrn=d.ximtmptrn join imtrn m on m.zid=h.zid and
 m.xdocnum=h.ximtmptrn and m.xdocrow=d.xtorlno join caitem i on d.xitem=i.xitem
where d.xitem<>'13-01-001-0192'  and h.xdept ='Automobile' and h.xdate between '2019-01-01' and '2019-12-31'
group by  d.xitem,xdesc,xunit

--2019 item wise consumption report (Per Month/year)
select d.xitem,d.xdesc,xunitpur,datename(Month,xdate),sum(xqty) qty,sum(xval) value from imtrn h join caitem d on h.zid=d.zid and h.xitem=d.xitem where xdoctype='SR--'
 and xaction='Issue'  and xdept='Automobile' and
xdate between '2019-01-01' and '2019-12-31' and h.xitem<>'13-01-001-0192' and h.zid=100000
group by d.xitem,d.xdesc,xunitpur,datename(Month,xdate)

select h.xvehicle,h.xordernum,h.ximtrnnum,xqtyreq,xicno,d.xbatch,xmnfst,xbrand,d.xstrmeter,xlong,m.xval,h.ztime
from vmrepmaint h join vmrepmaintd d on h.zid=d.zid and h.xordernum=d.xordernum join imtrn m on
h.zid=m.zid and h.ximtrnnum=m.xdocnum and  m.xdocrow=d.xrow
 where h.xaction='Tyre'
 and xstatusord='Issue Created' and m.xdate between '2019-01-01' and '2019-12-31'