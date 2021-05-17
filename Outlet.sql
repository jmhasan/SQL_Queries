select ztime,xzone,xcus,dbo.cusname(xcus) Customer_Name,xrow,xid,xoutletname,xriid,dbo.empname(xriid) RI_Name,xziauth from 
caoutlet where xid ='TNG-00039' in ('MLV-00025','MLV-00023') --xcus='CUS-005363' and xoutletname like '%jisan%' order by ztime desc

select * from opadviceapp where xid='HBG-02869' --002061