--bhai kon kon distribution point ea truck capacity wise koyta trip hoise hoise jan 2020 te ota ektu lagbe. select xmaxload,xdelpoint,COUNT(xsornum) from opmachadv h join vmvech v on h.zid=v.zid and h.xvehicle=v.xvehicle where xstatusmach='4-Challaned' and h.xdate between '2020-01-01' and '2020-01-28' group by xmaxload,xdelpoint select * from opmachadv where xdelpoint='' and xstatusmach='4-Challaned' --truck capacity wise (10mt, 20mt 5mt, bulk )running month ea 1-100, 101-200, 200-400 ei km range ea koyta trip dise.... select xmaxcap,sum(case when trkm>0 and trkm<101 then 1 else 0 end ), sum(case when trkm>100 and trkm<201 then 1 else 0 end ), sum(case when trkm>200 and trkm<401 then 1 else 0 end ) from vmmovereg where xdate between '2020-01-01' and '2020-01-28' and xvehicle in (select xvehicle from vmvech) group by xmaxcap --or gari numbrt, move number, capacity, trip km...ei 4 ta field dea ekta report lagbe select xvehicle,COUNT(xsornum) from vmmovereg where xdate between '2020-01-01' and '2020-01-28' and xmovetype='In' and xtype='DO Delivery' group by xvehicle

select xmaxcap Capacity,sum(case when trkm>0 and trkm<101 then 1 else 0 end ) as'1-100',
sum(case when trkm>100 and trkm<201 then 1 else 0 end ) as '101-200' ,
sum(case when trkm>200 and trkm<401 then 1 else 0 end ) as '201-400',
sum(case when trkm>400 and trkm<601 then 1 else 0 end ) as '401-600',
sum(case when trkm>600 and trkm<801 then 1 else 0 end ) as '601-800',
sum(case when trkm>800 then 1 else 0 end ) as '800+'
 from vmmovereg where xdate between '2020-01-01' and '2020-01-28'
and xvehicle in (select xvehicle from vmvech)
group by xmaxcap  