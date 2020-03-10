--Numbers of challan vehicle capacity wise 
with temp as(
 select xdestin,xsornum,v.xmaxload,COUNT(xchlnum)as tot_chl from opchallan c join vmvech v on c.zid=v.zid and c.xvehicle=v.xvehicle
   where xconfirmt between '2020-02-01' and '2020-02-15'
  and xdelivery='Company' and xstatuschl='3-Invoiced' and xtypev='Vehicle' group by xdestin,xsornum,v.xmaxload)
  select xdestin,
  sum(case when tot_chl=1 and xmaxload=5 then 1 else 0 end) chl_1_5,
  sum(case when tot_chl=2 and xmaxload=5 then  1 else 0  end) chl_2_5,
  sum(case when tot_chl=3 and xmaxload=5 then  1 else 0  end) chl_3_5,
  sum(case when tot_chl=4 and xmaxload=5 then  1 else 0  end)chl_4_5,
  sum(case when tot_chl=5 and xmaxload=5 then  1 else 0  end)chl_5_5,

  sum(case when tot_chl=1 and xmaxload=10 then 1 else 0 end) chl_1_10,
  sum(case when tot_chl=2 and xmaxload=10 then  1 else 0  end) chl_2_10,
  sum(case when tot_chl=3 and xmaxload=10 then  1 else 0  end) chl_3_10,
  sum(case when tot_chl=4 and xmaxload=10 then  1 else 0  end)chl_4_10,
  sum(case when tot_chl=5 and xmaxload=10 then  1 else 0  end)chl_5_10,
  
  sum(case when tot_chl=1 and xmaxload=20 then 1 else 0 end) chl_1_20,
  sum(case when tot_chl=2 and xmaxload=20 then  1 else 0  end) chl_2_20,
  sum(case when tot_chl=3 and xmaxload=20 then  1 else 0  end) chl_3_20,
  sum(case when tot_chl=4 and xmaxload=20 then  1 else 0  end)chl_4_20,
  sum(case when tot_chl=5 and xmaxload=20 then  1 else 0  end)chl_5_20,
  
  sum(case when tot_chl=1 and xmaxload=30 then 1 else 0 end) chl_1_30,
  sum(case when tot_chl=2 and xmaxload=30 then  1 else 0  end) chl_2_30,
  sum(case when tot_chl=3 and xmaxload=30 then  1 else 0  end) chl_3_30,
  sum(case when tot_chl=4 and xmaxload=30 then  1 else 0  end)chl_4_30,
  sum(case when tot_chl=5 and xmaxload=30 then  1 else 0  end)chl_5_30,
  
   sum(case when tot_chl=1 and xmaxload=40 then 1 else 0 end) chl_1_40,
  sum(case when tot_chl=2 and xmaxload=40 then  1 else 0  end) chl_2_40,
  sum(case when tot_chl=3 and xmaxload=40 then  1 else 0  end) chl_3_40,
  sum(case when tot_chl=4 and xmaxload=40 then  1 else 0  end)chl_4_40,
  sum(case when tot_chl=5 and xmaxload=40 then  1 else 0  end)chl_5_40,
  COUNT(*) as total_trip from temp group by xdestin order by xdestin