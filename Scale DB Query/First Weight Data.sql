select * from Weight where tt<>0   order by tt desc --and CAST(carry as varchar)='Company Others' 

select * from  Weight  where convert(date, convert(varchar(50), fstweightDate), 101)<'2021-01-01'  and tt<>0

select * from weight_main where ID=461358 in (
select ID from Weight  where convert(date, convert(varchar(50), fstweightDate), 101)<'2021-01-01'  and tt<>0)

