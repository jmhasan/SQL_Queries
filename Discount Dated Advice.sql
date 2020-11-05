with advice as (
select a.xcus,c.xorg,c.xbloodgrp,c.xdistrict,(xqtysms-xqtycut) xqtysms,
(case when CONVERT(date,DATEADD(HOUR,-6,xconfirmt))='2020-10-01' or 
CONVERT(date,DATEADD(HOUR,-6,xconfirmt))='2020-10-08' or 
CONVERT(date,DATEADD(HOUR,-6,xconfirmt))='2020-10-12' or 
CONVERT(date,DATEADD(HOUR,-6,xconfirmt))='2020-10-15' then (xqtysms-xqtycut) else 0 end ) xqtysms_condition
 from opadvice a join cacus c on a.zid=c.zid and a.xcus=c.xcus 
where  xconfirmt between '2020-10-01 06:00:00.000' and  '2020-10-24 06:00:00.000'
and xstatusadvmach<>'1-Open' and a.xcus in ('CUS-000340','CUS-000321','CUS-001986','CUS-000041','CUS-001670','CUS-000352','CUS-000157','CUS-002195',
'CUS-000150','CUS-000060','CUS-000015','CUS-000376','CUS-005670','CUS-004356','CUS-000381','CUS-000131',
'CUS-000152','CUS-000156','CUS-005124','CUS-003833','CUS-000067','CUS-000014','CUS-000143','CUS-004909',
'CUS-003549','CUS-000217','CUS-004138','CUS-001854','CUS-005159','CUS-000374','CUS-000119','CUS-005643',
'CUS-001877','CUS-001752','CUS-000412','CUS-003463','CUS-003010','CUS-001679','CUS-002702','CUS-004984',
'CUS-000371','CUS-003807','CUS-002517','CUS-004380','CUS-004078','CUS-003888','CUS-002838','CUS-002716',
'CUS-001489','CUS-000366'))

select xcus,xorg,xbloodgrp,xdistrict,sum(xqtysms/20) tot_xqtysms,sum(xqtysms_condition/20) xqtysms_condition from advice 
group by xcus,xorg,xbloodgrp,xdistrict
