select xdate,xmobile,xmsg,xtype,zactive,xref,xtrnnum from zsmslog where xrow='1357755'

select * from zsmslog where   zactive=0
select * from tr2 


select *,   N'প্রিমিয়ার সিমেন্ট থেকে বিকাশ TrxID '+ xcode + N' ক্যাশ ইন পেয়ে থাকলে Yes এবং না পেলে No লিখে sms করুন' from tr2 


insert into zsmslog (zid,xdate,xmobile,xmsg,xtype,zactive,xref,xtrnnum) 
select 100000,GETDATE(),tr,N'প্রিমিয়ার সিমেন্ট থেকে বিকাশ TrxID '+ xcode + N' ক্যাশ ইন পেয়ে থাকলে Yes এবং না পেলে No লিখে sms করুন','ChallanSMS',0,xcode,'Offersms' from tr2 


select xdate,xmobile,xmsg,xtype,zactive,xref,xtrnnum from zsmslog where xtrnnum='Offersms' and zactive=0 and xref='8HH9LWN6SJ'




