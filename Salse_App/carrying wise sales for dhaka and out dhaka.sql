select xzone,xwh, 
sum(case when xtype='Own' and xshipcode='Vehicle' and xdelivery='Company' then xqtychl end) company_own_truck,
sum(case when xtype<>'Own' and xshipcode='Vehicle' and xdelivery='Company' then xqtychl end) company_rental,
sum(case when xshipcode<>'Vehicle' and xdelivery='Company' then xqtychl end) Company_own_Vessel,
sum (case when xshipcode<>'Vehicle' and xdelivery<>'Company' then xqtychl end) customer_vessel,
sum(case when xshipcode='Vehicle' and xdelivery<>'Company' then xqtychl end) customer_vehicle

 from opchallandt where xconfirmt between '2020-10-01 06:00' and '2020-11-01 06:00' and 
 xdiv in ('Dhaka','Out Dhaka') 
 group by xzone,xwh

  select sum(xqtychl) from opchallandt where xconfirmt between '2020-10-01 06:00' and '2020-11-01 06:00' and 
 xdiv in ('Dhaka','Out Dhaka')  