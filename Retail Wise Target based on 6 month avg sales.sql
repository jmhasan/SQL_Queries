with abc as (
select h.xzone,h.xcus,c.xorg,c.xgcus,c.xprbasicapp General_Com,
xprpfapp Realistic_com,xprbonusapp Retail_com,xpritaxapp Lifting_com,xprarrearapp Cas_dis,xprsuspapp Free_bag,
xpartial Cas_party,xprobe Promotional_offer,xprsubsistapp Yearly_com, h.xid,xoutletname, 
(select max(xdistrict) from caoutlet where xid=h.xid and xid<>'') District,
xriid, 
(select xname from prmst where xemp=h.xriid and zid='100000') RI_Name,
 (select xtsoid from cacushrc where xriid=h.xriid) xtsoid,
 (select xname from prmst  where xemp=(select xtsoid from cacushrc where xriid=h.xriid)) AI_Name, 
(select xziid from cazone where xzone=h.xzone) ZID,
 (select xname from prmst  where xemp=(select xziid from cazone where xzone=h.xzone)) ZI_Name, 
 Total,AVGSales,Nov2020, Feb2021,
 case when AVGSales<250 then 200 when AVGSales between 250 and 349 then 300
  when AVGSales between 350 and 449 then 400  when AVGSales between 450 and 549 then 500
  when AVGSales between 550 and 699 then 600  when AVGSales between 700 and 849 then 800
  when AVGSales between 850 and 1049 then 900  when AVGSales between 1050 and 1349 then 1200
  when AVGSales between 1350 and 1649 then 1500  when AVGSales between 1650 and 2149 then 1800
  when AVGSales between 2150 and 2749 then 2500  when AVGSales between 2750 and 3499 then 3000
  when AVGSales between 3500 and 4499 then 4000  when AVGSales between 4500 and 5499 then 5000
   when AVGSales>5499 then 6000 else '' end basedonavgSales,
   
case when Feb2021<250 then 200 when Feb2021 between 250 and 349 then 300
  when Feb2021 between 350 and 449 then 400  when Feb2021 between 450 and 549 then 500
  when Feb2021 between 550 and 699 then 600  when Feb2021 between 700 and 849 then 800
  when Feb2021 between 850 and 1049 then 900  when Feb2021 between 1050 and 1349 then 1200
  when Feb2021 between 1350 and 1649 then 1500  when Feb2021 between 1650 and 2149 then 1800
  when Feb2021 between 2150 and 2749 then 2500  when Feb2021 between 2750 and 3499 then 3000
  when Feb2021 between 3500 and 4499 then 4000  when Feb2021 between 4500 and 5499 then 5000
   when Feb2021>5499 then 6000 else 0 end basedonFeb2021,

    (select sum(case when xyear='2020' and xper='09' then Total else 0 end) from outlettargetmax  where xid =h.xid) Sep_20_Sales,
    (select sum(case when xyear='2020' and xper='10' then Total else 0 end) from outlettargetmax  where xid =h.xid) Oct_20_Sales,
    (select sum(case when xyear='2020' and xper='11' then Total else 0 end) from outlettargetmax  where xid =h.xid) Nov_20_Sales,
    (select sum(case when xyear='2020' and xper='12' then Total else 0 end) from outlettargetmax  where xid =h.xid) Dec_20_Sales,
    (select sum(case when xyear='2021' and xper='01' then Total else 0 end) from outlettargetmax  where xid =h.xid) Jan_21_Sales,
    (select sum(case when xyear='2021' and xper='02' then Total else 0 end) from outlettargetmax  where xid =h.xid) Feb_21_Sales,
    (select sum(case when xyear='2021' and xper='03' then Total else 0 end) from outlettargetmax  where xid =h.xid) Mar_21_Sales,
    (select sum(case when xyear='2021' and xper='04' then Total else 0 end) from outlettargetmax  where xid =h.xid) Apr_21_Sales,
    (select sum(case when xyear='2021' and xper='05' then Total else 0 end) from outlettargetmax2  where xid =h.xid) May_21_Sales,
     
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
 from outlettargetf2 h join cacus c on h.xcus=c.xcus)

 select  xzone,xcus,xorg,xgcus,General_Com,
Realistic_com,Retail_com,Lifting_com,Cas_dis,Free_bag,
 Cas_party, Promotional_offer, Yearly_com,
 sum(Sep_20_Sales) Sep_20_Sales ,
 sum(Oct_20_Sales) Oct_20_Sales,
 sum(Nov_20_Sales) Nov_20_Sales,
 sum(Dec_20_Sales) Dec_20_Sales,
 sum(Jan_21_Sales) Jan_21_Sales,
 sum(Feb_21_Sales) Feb_21_Sales,
 sum(Mar_21_Sales) Mar_21_Sales,
 sum(Apr_21_Sales) Apr_21_Sales,
 sum(May_21_Sales) May_21_Sales,
 sum(Criteria_3) Criteria_3,count(*) no_of_retail  from abc group by xzone,xcus,xorg,xgcus,General_Com,
Realistic_com,Retail_com,Lifting_com,Cas_dis,Free_bag,
 Cas_party, Promotional_offer, Yearly_com
