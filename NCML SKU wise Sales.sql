select  c.xbloodgrp,d.xitem,
(select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))  Bag_type,d.xqtychl,
--BM
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='1 PLY' 
and d.xitem='02-01-001-0005'  then d.xqtychl else 0 end) PCC_BM_1PLY,
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='2 PLY' 
and d.xitem='02-01-001-0005'  then d.xqtychl else 0 end) PCC_BM_2PLY,
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='Bulk' 
and d.xitem='02-01-001-0005'  then d.xqtychl else 0 end) PCC_BM_BULK,
--OPC
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='1 PLY' 
and d.xitem='02-01-001-0002'  then d.xqtychl else 0 end) OPC_1PLY,
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='2 PLY' 
and d.xitem='02-01-001-0002'  then d.xqtychl else 0 end) OPC_2PLY,
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='Bulk' 
and d.xitem='02-01-001-0002'  then d.xqtychl else 0 end) OPC_BULK,
--AM
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='1 PLY' 
and d.xitem='02-01-001-0003'  then d.xqtychl else 0 end) OPC_1PLY,
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='2 PLY' 
and d.xitem='02-01-001-0003'  then d.xqtychl else 0 end) OPC_2PLY,
(case when (select coalesce((select xcodealt from xcodes where zid=t.zid 
and xcode=t.xtypecat and xtype='Item Type'),'Customer Bag'))='Bulk' 
and d.xitem='02-01-001-0003'  then d.xqtychl else 0 end) OPC_BULK
from opchallan h  join opchalland d on h.zid=d.zid and h.xchlnum=d.xchlnum join cacus c on h.zid=c.zid and  h.xcus=c.xcus 
join opddt t on t.zid=d.zid and t.xdornum=d.xdornum
where xconfirmt between  '2020-10-01 06:00:00.000' and '2020-10-29 06:00:00.000'
and xstatuschl='3-Invoiced' 
