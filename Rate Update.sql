select zutime,xcus,xitem,xnetrate,xrem,GETDATE() from cacuscemrate where 
xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka'))

--update cacuscemrate set xnetrate=xnetrate+10,zutime=GETDATE(),xrem=xnetrate  where 
--xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka')),


select zutime,xcus,xitem,xnetrate,xrem from cacusrate where 
xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka'))

--update cacusrate set xnetrate=xnetrate+10,zutime=GETDATE(),xrem=xnetrate  where 
--xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka')),


-- Open order Rate update
select ztime,xcus,xitem,xqtyord,xrate,xrate+10,xchgdel,xlineamt,xqtyord*(xrate+10),xamt,xqtyord*((xrate+10)-xchgdel),xziauth from oporderapp where xziauth=0 and xdate='2021-08-16'
and xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka') ) and ztime>'2021-08-16 13:24:29.180'


--update oporderapp set xrate=xrate+10,xlineamt=xqtyord*(xrate+10),xamt=xqtyord*((xrate+10)-xchgdel)  where xziauth=0 and xdate='2021-08-16'
--and xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka')) and ztime<='2021-08-16 13:24:29.180',

--NCML Rate update 

select zutime,xcus,xitem,xnetrate,xrem,GETDATE() from cacuscorrt where 
xcus in (select xcus from cacus where xsimcardno='Chittagong')

--update cacuscorrt set xnetrate=xnetrate+10,zutime=GETDATE(),xrem=xnetrate  where 
--xcus in (select xcus from cacus where xsimcardno='Chittagong'),




----Last Update query 
select ztime,zutime,xcus,xwh,isincentive,xdesc,xitem,xqtyord,xrate,xrate-10,xchgdel,xlineamt,xqtyord*(xrate-10),xamt,xqtyord*((xrate-10)-xchgdel),xziauth from oporderapp where
 xziauth=1 and xdate='2021-08-16' and xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka') ) 
and xtrnnum not in (select xtrnnum from opordonline ) and ztime>='2021-08-16 13:24:29.180'



--update oporderapp set xrate=xrate-10,xlineamt=xqtyord*(xrate-10),xamt=xqtyord*((xrate-10)-xchgdel) where xziauth=1 and xdate='2021-08-16' and xcus in (select xcus from cacus where xsimcardno in ('Dhaka', 'Out Dhaka') ) 
--and xtrnnum not in (select xtrnnum from opordonline ) and ztime>='2021-08-16 13:24:29.180',