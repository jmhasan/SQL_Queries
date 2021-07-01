select zutime,xcus,xitem,xnetrate,xrem,GETDATE() from cacuscemrate where 
xcus in (select xcus from cacus where xbloodgrp in ('BOGRA','RANGPUR','RAJSHAHI') and xprpfapp<>'Yes')

select zutime,xcus,xitem,xnetrate,xrem  from cacusrate where 
xcus in (select xcus from cacus where xbloodgrp in ('BOGRA','RANGPUR','RAJSHAHI') and xprpfapp<>'Yes')

