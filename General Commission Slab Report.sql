select xcus,dbo.cusname(xcus) Cus_Name,dbo.cuszone(xcus) Cus_Zone,
sum(case when xblno=1 then xminqty else 0 end) minqty_01,
sum(case when xblno=1 then xdiscamt else 0 end) slab_01,
sum(case when xblno=2 then xminqty else 0 end) minqty_02,
sum(case when xblno=2 then xdiscamt else 0 end) slab_02,

sum(case when xblno=3 then xminqty else 0 end) minqty_03,
sum(case when xblno=3 then xdiscamt else 0 end) slab_03,
sum(case when xblno=4 then xminqty else 0 end) minqty_04,
sum(case when xblno=4 then xdiscamt else 0 end) slab_04,

sum(case when xblno=5 then xminqty else 0 end) minqty_05,
sum(case when xblno=5 then xdiscamt else 0 end) slab_05,
sum(case when xblno=6 then xminqty else 0 end) minqty_06,
sum(case when xblno=6 then xdiscamt else 0 end) slab_06,

sum(case when xblno=7 then xminqty else 0 end) minqty_07,
sum(case when xblno=7 then xdiscamt else 0 end) slab_07,
sum(case when xblno=8 then xminqty else 0 end) minqty_08,
sum(case when xblno=8 then xdiscamt else 0 end) slab_08
from cacomslab where xtype='General Commission' and zactive=1
group by xcus
