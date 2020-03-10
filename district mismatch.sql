select * from CustomerDetails where CustomerID='3542' and DistrictID is null ( CementTypeid is null)

select distinct xdistrict from erp200.ERPonTheNet.dbo.cacusrate where  xdistrict='Chittagang' or xthana='Motijheel'
 
select * from District where DistrictID='13' DistrictName='Gopalganj'
select * from thana where ThanaID=431

select * from District where DistrictName like '%Chi%' --Chittagang
select * frm 

select distinct xdistrict from  erp200.ERPonTheNet.dbo.cacusrate   where  
xdistrict not in (select DistrictName from District)


select distinct xthana from  erp200.ERPonTheNet.dbo.cacusrate   where   
xthana in ('Bagerhat','Gopalganj','Habiganj','Habigonj','Jessore','Khulna','Magura','Narail')

select distinct xdistrict from  erp200.ERPonTheNet.dbo.cacusrate   where   
xdistrict like '%Pan%' 


select * from CementType
select * from Thana where ThanaName like '%Nar%'
