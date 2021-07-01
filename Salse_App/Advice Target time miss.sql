with advkpi as(
 select  xzonedel,zid,xadvnum,xwh,xqtysms,xqty,xqtychl,xqtycut,xconfirmt,xchallantime,xouttime,xchkt,xstatusadvmach,
dateadd(HOUR,18,xconfirmt) xapptime,
(case when xqtysms=xqtychl+xqtycut and (case when xwh='FINISHED GOODS' then xouttime else xchallantime end)<dateadd(HOUR,18,xconfirmt) then 1 else 0 end) xrow,
(case when xqtysms=xqtychl+xqtycut and (case when xwh='FINISHED GOODS' 
then xouttime else xchallantime end)>dateadd(HOUR,18,xconfirmt) then 1 else 0 end) xrow1,
(case when xqtysms=xqtychl+xqtycut  then 1 else 0 end)xline ,
 convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) xdesc,
(case when convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) between '06:00:00' and '13:59:59' then 'A'
 when convert(varchar, (case when xwh='FINISHED GOODS' then
  xouttime else xchallantime end), 8) between '14:00:00' and '21:59:59' then 'B' else 'C' end ) xshift,
 (case when convert(varchar,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) <= '06:00:00'
 THEN convert(date,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end)-1) ELSE convert(date,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end))
end) xdate from opadvice   where xstatusadvmach in ('4-Mached','5-Voided') and xqtysms<>xqtycut
  and xdate between '2020-02-1' and '2020-02-29' and dbo.cusdiv(xcus)<>'Corporate') 
  
 select  h.xzonedel,h.xadvnum,max(v.xsornum),h.xconfirmt,max(v.xdotime),max(v.xouttime),max(v.xloadingtime),

 DATEDIFF(HOUR,h.xconfirmt,max(v.xdotime)) as xconfirmt_xdotime ,
 DATEDIFF(HOUR,max(v.xdotime),max(v.xloadingtime)) as xdotime_xloadingtime,
 DATEDIFF(HOUR,max(v.xloadingtime),max(v.xouttime)) as xloadingtime_xouttime,
 DATEDIFF(HOUR,h.xconfirmt,max(v.xouttime)) as xyz from advkpi h join macview d on h.zid=d.zid and h.xadvnum=d.xadvnum 
 join vmmovereg v on d.zid=v.zid and d.xsornum=v.xsornum where xrow1>0 
 and xzonedel in ('DHAKA MIDDLE','MYMENSINGH','DHAKA NORTH','GAZIPUR','RETAILER','MUNSHIGONJ','RETAIL DEMRA')
 group by h.xzonedel,h.xadvnum,h.xconfirmt,h.xchallantime   order by xzonedel