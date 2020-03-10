select ztime,zemail,xpassword,xname,xadd,xdiv from zxusers where zactive='1' and xdiv='' and zid=100000

select * from zxusers where zemail='sujon.hossen@premiercement.com'

select xdept,COUNT(*) from prmst where xstatusemp='A-Active' group by xdept

select  *  from prmst where xstatusemp='A-Active'  and xdept='Vat' and xname like '%Nazmul Hossain%'

select  ztime,xemp,xname,xdept,xdesig,xlocation,xstatusemp  from prmst where xdesig not in ('DRIVER','Operator','Helper') 
 and xname like '%sohrab%' --Ranjit Kumar Paul
 
select * from prmst where xemp='001366' moniruz.zaman

select * from zxusers where zemail like '%mirza%'