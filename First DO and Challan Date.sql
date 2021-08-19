select  c.xbloodgrp xzone,c.xcus,c.xorg,c.xgcus,CONVERT(date,DATEADD(HOUR,-6,c.ztime)) Create_Time,xcrlimit Credit_limit, xamount BG,xsales Cheque,
(select min(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) from opdorddt where zid=c.zid and xcus=c.xcus) first_DO_Date,
(select min(CONVERT(date,DATEADD(HOUR,-6,xconfirmt))) from opchallandt where zid=c.zid and xcus=c.xcus) first_Challan_Date
 from cacus c where  CONVERT(date,DATEADD(HOUR,-6,c.ztime))>= '2020-01-01'
and c.xsimcardno<>'Bag Plant'



