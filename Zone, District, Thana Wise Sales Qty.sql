with cte as ( select xzonedel,xyear,xper,xdelpoint thana,xqtychl
 from opchallandt where xdiv in ('Dhaka','Out Dhaka') and xdatecom>='2020-09-01' 
 --and xrow is null ), cte2 as(select (select xdistrict from cadelpoint where xthana=cte.thana)
 xdistrict,xzonedel,thana,xper,xqtychl from cte) select xzonedel,xdistrict,thana, 
 sum(case when xper=9 then xqtychl else 0 end)/20 from cte2 group by xzonedel,xdistrict,thana union all select xzone,xdistrict,xthana,0 from cadelpoint where xthana not in (select xdelpoint from opchallandt where xdatecom>='2020-09-01' )


--add customer and customer name
with cte as (
select xzonedel,xyear,xper,xdelpoint thana,xqtychl from opchallandt 
where xdiv in ('Dhaka','Out Dhaka') and xdatecom>='2020-06-01'),
cte2 as(select (select xdistrict from cadelpoint where xthana=cte.thana)xdistrict,xzonedel,thana,xper,xqtychl from cte)
select xzonedel,xdistrict,thana,
sum(case when xper=6 then xqtychl else 0 end)/20,
sum(case when xper=7 then xqtychl else 0 end)/20,
sum(case when xper=8 then xqtychl else 0 end)/20,
sum(case when xper=9 then xqtychl else 0 end)/20,
sum(case when xper=10 then xqtychl else 0 end)/20 from cte2
group by xzonedel,xdistrict,thana
union all
select xzone,xdistrict,xthana,0,0,0,0,0 from cadelpoint where xthana not in (select xdelpoint from opchallandt
 where  xdatecom>='2020-06-01')