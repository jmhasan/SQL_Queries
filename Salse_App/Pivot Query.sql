SELECT  xbloodgrp ,xcus,xorg, freebag,retailcomm,xwh,xper,   
[PPC],[OPC],[PCC-BM],[PCC BM - Mongla],[PCC-AM],[OPC - Mongla],[Anwar Cement - PCC BM]
FROM 
   ( select c.xbloodgrp ,h.xcus,c.xorg,ci.xdesc,
   h.xwh,month(h.xdate) xper,
	case when xtypeloc='No' and 
	(case when c.xperc=4 then 16 when c.xperc=3 then 11 when c.xperc=2 then 8 else 0 end)>0 then 
	d.xrate+(case when c.xperc=4 then 16 when c.xperc=3 then 11 when c.xperc=2 then 8 else 0 end) else d.xrate end xcost,
	case when c.xperc=4 then 16 when c.xperc=3 then 11 when c.xperc=2 then 8 else 0 end  freebag  ,
	coalesce((select xdiscamt from cacomslab where xtype='Retail Commission' and zactive=1 and xcus=c.xcus),0) retailcomm
	 from opdor h join opddt d on h.xdornum=d.xdornum  join cacus c on h.xcus=c.xcus
	 join caitem ci on d.xitem=ci.xitem and ci.zid=d.zid
	where h.xdate >= '2019-06-01' and c.xbloodgrp='RANGPUR' --and c.xcus='CUS-000060' --and month(h.xdate)=11
   ) ps
PIVOT
   ( min (xcost)
     FOR xdesc IN (   [PPC],[OPC],[PCC-BM],[PCC BM - Mongla],[PCC-AM],[OPC - Mongla],[Anwar Cement - PCC BM])
   ) AS pvt

--Dynamic Pivot

DECLARE @DynamicPivotQuery AS NVARCHAR(MAX)
DECLARE @ColumnName AS NVARCHAR(MAX)
 
--Get distinct values of the PIVOT Column 
SELECT @ColumnName= ISNULL(@ColumnName + ',','') 
       + QUOTENAME(xymonthfrom)
FROM (SELECT distinct convert(varchar(7), xdate, 126) as xymonthfrom FROM cadate 
where zid=100000 and xyear between 2018 and 2019) AS xymonthfrom
 
--Prepare the PIVOT query using the dynamic 
SET @DynamicPivotQuery = 
  N'select  xzone,xcus,xorg, ' + @ColumnName + ' from (SELECT xzone,xcus,xorg,xymonthfrom,xqtychl
    FROM opchallandt  where   xconfirmt>=''2018-01-01'' and xdiv=''Corporate''  and xstatuschl<>''1-Open'' ) ps
    PIVOT(SUM(xqtychl) 
          FOR xymonthfrom IN (' + @ColumnName + ')) AS pvt'
--Execute the Dynamic Pivot Query
EXEC sp_executesql @DynamicPivotQuery
