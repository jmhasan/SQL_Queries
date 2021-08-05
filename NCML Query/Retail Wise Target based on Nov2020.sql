with abc as (
select *,
     
--Criteria_3
case  when  FLOOR(novsales/100)*100<=200 then 200
when    FLOOR(novsales/100)*100 between 201 and 300 then 300 when novsales>0 and  FLOOR(novsales/100)*100 between 301 and 400 then 400 
when   FLOOR(novsales/100)*100 between 401 and 500 then 500 when novsales>0 and  FLOOR(novsales/100)*100 between 501 and 699 then 600
when   FLOOR(novsales/100)*100 between 700 and 849 then 800 when novsales>0 and  FLOOR(novsales/100)*100 between 850 and 1049 then 900  
when   FLOOR(novsales/100)*100 between 1050 and 1349 then 1200 when novsales>0 and  FLOOR(novsales/100)*100 between 1350 and 1649 then 1500
when  FLOOR(novsales/100)*100 between 1650 and 2149 then 1800 when novsales>0 and  FLOOR(novsales/100)*100 between 2150 and 2749 then 2500
when   FLOOR(novsales/100)*100 between 2750 and 3499 then 3000 when novsales>0 and  FLOOR(novsales/100)*100 between 3500 and 4499 then 4000
when   FLOOR(novsales/100)*100 between 4500 and 5499 then 5000 when novsales>0 and  FLOOR(novsales/100)*100>5499 then 6000 else 0 end Criteria_3
 from ncmlnovsales )

 select xzone,xcusid,xorg,sum(Criteria_3) from abc group by xzone,xcusid,xorg






