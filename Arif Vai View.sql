
--Create view on 30-07-2021
CREATE view aiview as 
select xtsoid,COUNT(xriid) tot_ri from cacushrc 
group by xtsoid

select * from aiview

create VIEW aicalendar as 

select zid,CONVERT(DATE,xdate) xdate,xyear,xper,xweekmth,xmonthname,day(xdate) xdayno, UPPER(Left(CAST(xname AS varchar), 3)) xname, 
(case when xname='Saturday' then 1 when xname='Sunday' then 2 when xname='Monday' then 3
 when xname='Tuesday' then 4  when xname='Wednesday' then 5 when xname='Thursday' then 6   else 7 end) xday ,
xtsoid from cadate, aiview where  
 xyear=(case when MONTH(getdate())=12 then year(getdate())+1 else year(getdate())  end) and 
xper=(case when MONTH(getdate())=12 then 01 else MONTH(getdate())+1 end) 


select * from    zicalendar
select * from    aicalendar


--for zicalendarview
create view ziroutec as
select  h.zid, h.xdate, h.xyear, h.xper, h.xweekmth, h.xmonthname, h.xdayno, h.xname, h.xday, h.xziid, 
d.xriid, d.riname, xtsoid, created_by, comment, xstatus,ziauth,modauth
from zicalendar h  left OUTER join aiziroutep d on h.xziid= d.created_by and h.xdate=CONVERT(DATE,d.xdate)


--for zicalendarview
create view airoutec as
select  h.zid, h.xdate, h.xyear, h.xper, h.xweekmth, h.xmonthname, h.xdayno, h.xname, h.xday, d.xziid, 
d.xriid, d.riname, h.xtsoid, created_by, comment, xstatus,ziauth,modauth
from aicalendar h  left OUTER join aiziroutep d on h.xtsoid= d.created_by and h.xdate=CONVERT(DATE,d.xdate)

select * from ziroutec
select * from airoutec







---Old View 
select  xdate,zid,year(xdate) xyear, xpre as xper, (select xweekmth from cadate where CONVERT(DATE,xdate)=aiziroutep.xdate 
and xyear=year(aiziroutep.xdate) and xper=aiziroutep.xpre) as  xweekmth, xdayno,xname, xday,  xriid, riname, xziid, xtsoid, created_by, comment, xstatus,ziauth,modauth
from aiziroutep where
 year(xdate)=(case when MONTH(getdate())=12 then year(getdate())+1 else year(getdate())  end) and 
xpre=(case when MONTH(getdate())=12 then MONTH(getdate()) else MONTH(getdate())+1 end) 
UNION all 
select CONVERT(DATE,xdate),c.zid,xyear, xper,xweekmth,  day(xdate) xdayno, UPPER(Left(CAST(xname AS varchar), 3)) xname, 
(case when xname='Saturday' then 1 when xname='Sunday' then 2 when xname='Monday' then 3
 when xname='Tuesday' then 4  when xname='Wednesday' then 5 when xname='Thursday' then 6   else 7 end) xday ,
 '' xriid,'' riname,h.xziid,'' xtsoid, '' created_by, '' comment, '' xstatus, '' ziauth,'' modauth from cadate c ,ziview h where
 xyear=(case when MONTH(getdate())=12 then year(getdate())+1 else year(getdate())  end) and 
xper=(case when MONTH(getdate())=12 then MONTH(getdate()) else MONTH(getdate())+1 end) 

--and xdate not in (select xdate from aiziroutep where xziid=h.xziid)  and  h.xziid='000076'


select xziid,xdate,xriid,COUNT(*) from aiziroutec where xziid='001052'
GROUP by xziid,xdate,xriid

select ziauth,modauth from aiziroutep

select * from cadate ,cacushrc where xyear=2021 and xper=8

select a.xdate,b.xdate,  xdayno,xday,  xriid, riname, xziid, xtsoid, created_by, comment, xstatus
 from aiziroutep a cross join cadate b where  xyear=2021 and xper=07 order by b.xdate

select xdate,xweekmth,xname,
(case when xname='Saturday' then 1 when xname='Sunday' then 2 when xname='Monday' then 3
 when xname='Tuesday' then 4  when xname='Wednesday' then 5 when xname='Thursday' then 6   else 7 end)
from cadate where xyear=2021 and xper=07 order by xdate


DECLARE @date date = '2020-07-20';
SELECT DATEPART(week, @date);

SELECT xname,UPPER(Left(CAST(xname AS varchar), 3)) from cadate


select  case when MONTH(getdate())=12 then year(getdate())+1 else year(getdate())  end, 
case when MONTH(getdate())=12 then MONTH(getdate()) else MONTH(getdate())+1  end  from cadate where xyear=2021 and xper=07 


select  case when MONTH('2021-12-04')=12 then year(getdate())+1 else year(getdate())  end, 
case when MONTH(2021-12-04)=12 then MONTH(getdate()) else MONTH(getdate())+1  end  from cadate where xyear=2021 and xper=07 
