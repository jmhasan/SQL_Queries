-- Table Name retailtarget,retailtargetf,retailtargetf2

select h.xzone,h.xcus,c.xorg,c.xgcus, h.xid,xoutletname, 
(select max(xdistrict) from caoutlet where xid=h.xid and xid<>'') District,
xriid, 
(select xname from prmst where xemp=h.xriid and zid='100000') RI_Name,
 (select xtsoid from cacushrc where xriid=h.xriid) xtsoid,
 (select xname from prmst  where xemp=(select xtsoid from cacushrc where xriid=h.xriid)) AI_Name, 
(select xziid from cazone where xzone=h.xzone) ZID,
 (select xname from prmst  where xemp=(select xziid from cazone where xzone=h.xzone)) ZI_Name, 
 Total,AVGSales,Nov2020,
     
--Criteria_3
case  when Nov2020=0 and  FLOOR(AVGSales/100)*100<=200 then 200
 when   Nov2020=0 and  FLOOR(AVGSales/100)*100 between 201 and 300 then 300 when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 301 and 400 then 400 
 when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 401 and 500 then 500 when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 501 and 699 then 600
when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 700 and 849 then 800 when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 850 and 1049 then 900  
when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 1050 and 1349 then 1200 when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 1350 and 1649 then 1500
when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 1650 and 2149 then 1800 when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 2150 and 2749 then 2500
when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 2750 and 3499 then 3000 when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 3500 and 4499 then 4000
when Nov2020=0 and  FLOOR(AVGSales/100)*100 between 4500 and 5499 then 5000 when Nov2020=0 and  FLOOR(AVGSales/100)*100>5499 then 6000 
when Nov2020=0 and  FLOOR(AVGSales/100)*100<=200 then 200

 when Nov2020>0 and  FLOOR(Nov2020/100)*100<=200 then 200
when   Nov2020>0 and  FLOOR(Nov2020/100)*100 between 201 and 300 then 300 when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 301 and 400 then 400 
when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 401 and 500 then 500 when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 501 and 699 then 600
when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 700 and 849 then 800 when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 850 and 1049 then 900  
when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 1050 and 1349 then 1200 when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 1350 and 1649 then 1500
when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 1650 and 2149 then 1800 when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 2150 and 2749 then 2500
when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 2750 and 3499 then 3000 when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 3500 and 4499 then 4000
when Nov2020>0 and  FLOOR(Nov2020/100)*100 between 4500 and 5499 then 5000 when Nov2020>0 and  FLOOR(Nov2020/100)*100>5499 then 6000 else 0 end Criteria_3
 into retailtargetraw from retailtargetf2 h join cacus c on h.xcus=c.xcus where xgcus in ('Dealer','Retailer') 

select * from retailtargetraw

