--Customer Slab Report
with abc as (
select ROW_NUMBER () OVER (PARTITION BY xcus ORDER BY xcus) AS xrow ,zid,xcus,xtype,xblno,xminqty,xmaxqty,xdiscamt,zactive from cacomslab where xtype='General Commission'
  and zactive=1) --and xcus='CUS-003959')
  select c.xbloodgrp,a.xcus,c.xorg,
   sum (case when xrow=1 then xminqty end) xminqty_1,
 sum (case when xrow=1 then xdiscamt end) xdiscamt_1,
  sum (case when xrow=2 then xminqty end) xminqty_2,
  sum(case when xrow=2 then xdiscamt end) xdiscamt_2,
    sum (case when xrow=3 then xminqty end) xminqty_3,
   sum (case when xrow=3 then xdiscamt end) xdiscamt_3,
     sum (case when xrow=4 then xminqty end) xminqty_4,
  sum(case when xrow=4 then xdiscamt end) xdiscamt_4,
    sum (case when xrow=5 then xminqty end) xminqty_5,
   sum (case when xrow=5 then xdiscamt end) xdiscamt_5,
     sum (case when xrow=6 then xminqty end) xminqty_6,
  sum(case when xrow=6 then xdiscamt end) xdiscamt_6,
    sum (case when xrow=7 then xminqty end) xminqty_7,
    sum(case when xrow=7 then xdiscamt end) xdiscamt_7
      from abc a join cacus c on a.zid=c.zid and a.xcus=c.xcus 
    group by c.xbloodgrp,a.xcus,c.xorg
