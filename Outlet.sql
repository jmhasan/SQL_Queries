select ztime,xzone,xcus,dbo.cusname(xcus) Customer_Name,xrow,xid,xoutletname,xriid,dbo.empname(xriid) RI_Name,xziauth from 
caoutlet where  xcus='CUS-000352' order by ztime desc

select * from opadviceapp where xid='HBG-02869' --002061
