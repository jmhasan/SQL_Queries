

select ID,TRUCK_NUMBER,fstweightDate,sndWeightDate,MatrilpackType,carry,PackAmount,fstWeight,sndWeight,NetWeight,
avg,tol,OPERATOR_NAME1,OPERATOR_NAME2 from weight_main 
where convert(date, convert(varchar(50), sndWeightDate), 101) between'2018-03-01' and '2018-04-30' and savedata=1
order by convert(date, convert(varchar(50), sndWeightDate), 101)

