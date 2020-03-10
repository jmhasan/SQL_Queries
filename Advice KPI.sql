create view advkpi(zid,xadvnum,xwh,xqtysms,xqty,xqtychl,xqtycut,xconfirmt,xchallantime,xchkt,xstatusadvmach,
xapptime,xrow,xline,xdesc,xshift,xdate) 
as
select  zid,xadvnum,xwh,xqtysms,xqty,xqtychl,xqtycut,xconfirmt,xchallantime,xchkt,xstatusadvmach,
dateadd(HOUR,24,xconfirmt) xapptime,
(case when xqtysms=xqtychl+xqtycut and xchallantime<dateadd(HOUR,24,xconfirmt) then 1 else 0 end) xrow,
(case when xqtysms=xqtychl+xqtycut  then 1 else 0 end)xline ,
 convert(varchar, xchallantime, 8) xdesc,
(case when convert(varchar, xchallantime, 8) between '06:00:00' and '13:59:59' then 'A'
 when convert(varchar, xchallantime, 8) between '14:00:00' and '21:59:59' then 'B' else 'C' end ) xshift,
 (case when convert(varchar,xchallantime, 8) <= '06:00:00' THEN convert(date,xchallantime-1) ELSE convert(date,xchallantime)
end) xdate 
 from opadvice where xstatusadvmach in ('4-Mached','5-Voided') and xqtysms<>xqtycut

select zid,xdate,xshift,SUM(xrow),SUM(xline),(SUM(xrow)*100)/SUM(xline) from advkpi    where xdate='2020-01-16'
group by zid,xdate,xshift



--after change 

create view advkpi(zid,xadvnum,xwh,xqtysms,xqty,xqtychl,xqtycut,xconfirmt,xchallantime,xouttime,xchkt,xstatusadvmach,
xapptime,xrow,xline,xdesc,xshift,xdate) 
as
select  zid,xadvnum,xwh,xqtysms,xqty,xqtychl,xqtycut,xconfirmt,xchallantime,xouttime,xchkt,xstatusadvmach,
dateadd(HOUR,18,xconfirmt) xapptime,
(case when xqtysms=xqtychl+xqtycut and (case when xwh='FINISHED GOODS' then xouttime else xchallantime end)<dateadd(HOUR,18,xconfirmt) then 1 else 0 end) xrow,
(case when xqtysms=xqtychl+xqtycut  then 1 else 0 end)xline ,
 convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) xdesc,
(case when convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) between '06:00:00' and '13:59:59' then 'A'
 when convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) between '14:00:00' and '21:59:59' then 'B' else 'C' end ) xshift,
 (case when convert(varchar,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) <= '06:00:00'
 THEN convert(date,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end)-1) ELSE convert(date,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end))
end) xdate from opadvice where xstatusadvmach in ('4-Mached','5-Voided') and xqtysms<>xqtycut

--Jan 2020....trade er zone narayanganj ea overall 18 hrs dhone otif Koto % r 12 hrs dhore otif Koto % ektu Jana dorkar

  with advkpi as(
 select  xzonedel,zid,xadvnum,xwh,xqtysms,xqty,xqtychl,xqtycut,xconfirmt,xchallantime,xouttime,xchkt,xstatusadvmach,
dateadd(HOUR,18,xconfirmt) xapptime,
(case when xqtysms=xqtychl+xqtycut and (case when xwh='FINISHED GOODS' then xouttime else xchallantime end)<dateadd(HOUR,18,xconfirmt) then 1 else 0 end) xrow,
(case when xqtysms=xqtychl+xqtycut  then 1 else 0 end)xline ,
 convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) xdesc,
(case when convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) between '06:00:00' and '13:59:59' then 'A'
 when convert(varchar, (case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) between '14:00:00' and '21:59:59' then 'B' else 'C' end ) xshift,
 (case when convert(varchar,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end), 8) <= '06:00:00'
 THEN convert(date,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end)-1) ELSE convert(date,(case when xwh='FINISHED GOODS' then xouttime else xchallantime end))
end) xdate from opadvice where xstatusadvmach in ('4-Mached','5-Voided') and xqtysms<>xqtycut
  and xdate between '2020-01-1' and '2020-01-29' and dbo.cusdiv(xcus)<>'Corporate') 
 select 
 xzonedel,xshift,SUM(xrow) as xrow,SUM(xline) as xline,(SUM(xrow)*100)/SUM(xline) as
 xdaysdel from advkpi group by xshift,xzonedel
