select a.xadvnum,a.xouttime,v.xouttime,m.xdelivery,a.xwh,m.xtype,v.xtypev,a.xshipcode,v.xmovetype from opadvice a join macview m on a.zid=m.zid and a.xadvnum=m.xadvnum
join vmmovereg v on m.zid=v.zid and m.xsornum=v.xsornum where 
v.xouttime between '2020-01-01' and '2020-03-04'
 and a.xwh='FINISHED GOODS' and a.xouttime='2999-12-31 00:00:00.000'
order by v.xouttime desc