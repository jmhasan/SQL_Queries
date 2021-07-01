
select * from token_number

select * from Weight where tt<>0 order by tt desc

--drop table token_number

--select RANK() over (order by ID) as token,ID,tt into token_number from Weight where tt<>0 

--update weight set tt=(select token from token_number where ID=Weight.ID) where tt<>0 
