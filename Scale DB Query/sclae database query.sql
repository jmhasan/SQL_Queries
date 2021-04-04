select  CAST(carnum as varchar(8000)),COUNT(*) from Carbackup group by  CAST(carnum as varchar(8000))
'DM U 11-2334','DM U 11-3420'

select *   from [Weight] where tt<>0 and ( CAST(truck_number as varchar(8000)) like '%4018%' 
or CAST(truck_number as varchar(8000)) like '%2528%') --or DHAKA METRO SHA 11-2528


select truck_number, SUBSTRING (CAST(truck_number as varchar(8000)),(len(CAST(truck_number as varchar(8000)))-3),4),
(select carnum from Car where
SUBSTRING (CAST(carnum as varchar(8000)),(len(CAST(carnum as varchar(8000)))-3),4)=
SUBSTRING (CAST([Weight].truck_number as varchar(8000)),(len(CAST([Weight].truck_number as varchar(8000)))-3),4) )
 from    [Weight]
  where tt<>0  and  CAST(carry as varchar(8000))='Company'
and (select carnum from Car where
SUBSTRING (CAST(carnum as varchar(8000)),(len(CAST(carnum as varchar(8000)))-3),4)=
SUBSTRING (CAST([Weight].truck_number as varchar(8000)),(len(CAST([Weight].truck_number as varchar(8000)))-3),4) ) is not null
