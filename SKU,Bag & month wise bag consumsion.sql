with xyz as (
select xzone,xper,xyear,(select coalesce((select xcodealt from xcodes where xcodes.zid=opchallandt.zid 
and xcode=opchallandt.xtypecat and xcodes.xtype='Item Type'),'Customer Bag'))  Bag_type,
(select xitemold from caitem where zid=opchallandt.zid and xitem=opchallandt.xitem )item,xqtychl
from opchallandt where xconfirmt between  '2020-01-01 06:00:00.000' and '2020-07-01 06:00:00.000'
and xstatuschl='3-Invoiced' and xdiv<>'Bag Plant')

 select xzone,
 --jan
 sum(case when Bag_type='1 PLY' and item='PCC-BM' and xper='1'  then xqtychl else 0 end)PCC_BM_1_jan,
 sum(case when Bag_type='2 PLY' and item='PCC-BM' and xper='1' then xqtychl else 0 end)PCC_BM_2_jan,
 sum(case when Bag_type='1 PLY' and item='OPC' and xper='1' then xqtychl else 0 end )OPC_1_jan,
 sum(case when Bag_type='2 PLY' and item='OPC' and xper='1' then xqtychl else 0 end )OPC_2_jan,
 sum(case when Bag_type='1 PLY' and item='PPC' and xper='1' then xqtychl else 0 end )PPC_1_jan,
 sum(case when Bag_type='2 PLY' and item='PPC' and xper='1' then xqtychl else 0 end )PPC_2_jan,
 sum(case when Bag_type='1 PLY' and item='PCC-AM' and xper='1' then xqtychl else 0 end )PCC_AM_1_jan,
 sum(case when Bag_type='2 PLY' and item='PCC-AM' and xper='1' then xqtychl else 0 end )PCC_AM_2_jan,
 --feb
 sum(case when Bag_type='1 PLY' and item='PCC-BM' and xper='2'  then xqtychl else 0 end)PCC_BM_1_feb,
 sum(case when Bag_type='2 PLY' and item='PCC-BM' and xper='2' then xqtychl else 0 end)PCC_BM_2_feb,
 sum(case when Bag_type='1 PLY' and item='OPC' and xper='2' then xqtychl else 0 end )OPC_1_feb,
 sum(case when Bag_type='2 PLY' and item='OPC' and xper='2' then xqtychl else 0 end )OPC_2_feb,
 sum(case when Bag_type='1 PLY' and item='PPC' and xper='2' then xqtychl else 0 end )PPC_1_feb,
 sum(case when Bag_type='2 PLY' and item='PPC' and xper='2' then xqtychl else 0 end )PPC_2_feb,
 sum(case when Bag_type='1 PLY' and item='PCC-AM' and xper='2' then xqtychl else 0 end )PCC_AM_1_feb,
 sum(case when Bag_type='2 PLY' and item='PCC-AM' and xper='2' then xqtychl else 0 end )PCC_AM_2_feb,
 --mar
 sum(case when Bag_type='1 PLY' and item='PCC-BM' and xper='3'  then xqtychl else 0 end)PCC_BM_1_mar,
 sum(case when Bag_type='2 PLY' and item='PCC-BM' and xper='3' then xqtychl else 0 end)PCC_BM_2_mar,
 sum(case when Bag_type='1 PLY' and item='OPC' and xper='3' then xqtychl else 0 end )OPC_1_mar,
 sum(case when Bag_type='2 PLY' and item='OPC' and xper='3' then xqtychl else 0 end )OPC_2_mar,
 sum(case when Bag_type='1 PLY' and item='PPC' and xper='3' then xqtychl else 0 end )PPC_1_mar,
 sum(case when Bag_type='2 PLY' and item='PPC' and xper='3' then xqtychl else 0 end )PPC_2_mar,
 sum(case when Bag_type='1 PLY' and item='PCC-AM' and xper='3' then xqtychl else 0 end )PCC_AM_1_mar,
 sum(case when Bag_type='2 PLY' and item='PCC-AM' and xper='3' then xqtychl else 0 end )PCC_AM_2_mar,
 --Apr
 sum(case when Bag_type='1 PLY' and item='PCC-BM' and xper='4'  then xqtychl else 0 end)PCC_BM_1_april,
 sum(case when Bag_type='2 PLY' and item='PCC-BM' and xper='4' then xqtychl else 0 end)PCC_BM_2_april,
 sum(case when Bag_type='1 PLY' and item='OPC' and xper='4' then xqtychl else 0 end )OPC_1_april,
 sum(case when Bag_type='2 PLY' and item='OPC' and xper='4' then xqtychl else 0 end )OPC_2_april,
 sum(case when Bag_type='1 PLY' and item='PPC' and xper='4' then xqtychl else 0 end )PPC_1_april,
 sum(case when Bag_type='2 PLY' and item='PPC' and xper='4' then xqtychl else 0 end )PPC_2_april,
 sum(case when Bag_type='1 PLY' and item='PCC-AM' and xper='4' then xqtychl else 0 end )PCC_AM_1_april,
 sum(case when Bag_type='2 PLY' and item='PCC-AM' and xper='4' then xqtychl else 0 end )PCC_AM_2_april,
 --May
 sum(case when Bag_type='1 PLY' and item='PCC-BM' and xper='5'  then xqtychl else 0 end)PCC_BM_1_may,
 sum(case when Bag_type='2 PLY' and item='PCC-BM' and xper='5' then xqtychl else 0 end)PCC_BM_2_may,
 sum(case when Bag_type='1 PLY' and item='OPC' and xper='5' then xqtychl else 0 end )OPC_1_may,
 sum(case when Bag_type='2 PLY' and item='OPC' and xper='5' then xqtychl else 0 end )OPC_2_may,
 sum(case when Bag_type='1 PLY' and item='PPC' and xper='5' then xqtychl else 0 end )PPC_1_may,
 sum(case when Bag_type='2 PLY' and item='PPC' and xper='5' then xqtychl else 0 end )PPC_2_may,
 sum(case when Bag_type='1 PLY' and item='PCC-AM' and xper='5' then xqtychl else 0 end )PCC_AM_1_may,
 sum(case when Bag_type='2 PLY' and item='PCC-AM' and xper='5' then xqtychl else 0 end )PCC_AM_2_may,
 --jun
 sum(case when Bag_type='1 PLY' and item='PCC-BM' and xper='6'  then xqtychl else 0 end)PCC_BM_1_jun,
 sum(case when Bag_type='2 PLY' and item='PCC-BM' and xper='6' then xqtychl else 0 end)PCC_BM_2_jun,
 sum(case when Bag_type='1 PLY' and item='OPC' and xper='6' then xqtychl else 0 end )OPC_1_jun,
 sum(case when Bag_type='2 PLY' and item='OPC' and xper='6' then xqtychl else 0 end )OPC_2_jun,
 sum(case when Bag_type='1 PLY' and item='PPC' and xper='6' then xqtychl else 0 end )PPC_1_jun,
 sum(case when Bag_type='2 PLY' and item='PPC' and xper='6' then xqtychl else 0 end )PPC_2_jun,
 sum(case when Bag_type='1 PLY' and item='PCC-AM' and xper='6' then xqtychl else 0 end )PCC_AM_1_jun,
 sum(case when Bag_type='2 PLY' and item='PCC-AM' and xper='6' then xqtychl else 0 end )PCC_AM_2_jun,
 SUM(xqtychl) Total
from xyz group by xzone

