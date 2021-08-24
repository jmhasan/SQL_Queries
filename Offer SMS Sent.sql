select xdate,xmobile,xmsg,xtype,zactive,xref,xtrnnum from zsmslog where xrow='1357755'

select xrow,zid, ztime, xdate, xtrnnum, xref, xmsg, xtype, xmobile, xstatus, zemail, xconfirmt, zactive from zsmslog where   xtrnnum='Offersms'
and xdate='2021-08-24' and zactive=0




--insert into zsmslog (zid, ztime, xdate, xtrnnum, xref, xmsg, xtype, xmobile, xstatus, zemail, xconfirmt, zactive), 
select zid,GETDATE(),GETDATE(),'Offersms',xtrnnum,  N'প্রিমিয়ার সিমেন্ট থেকে ' +xtype+' '+ 'TrxID '+ xtrnnum + N' ক্যাশ ইন পেয়ে থাকলে Yes এবং না পেলে No লিখে sms করুন',
'ChallanSMS',xmobile,'','jm_hasan@premiercement.com',GETDATE(),0 from cashdisbursement  where zactive=1 and xtype<>'Bkash'


SELECT        zid, xtype, xstatus, ztime, zutime, xmobile, xtrnnum, xremark, xamount, xfee, xextrafee, xstatusjob, zactive
FROM            cashdisbursement where zactive=0



select * from   zsmslog where xtrnnum='Offersms' and xdate='2021-08-19' and zactive=0


--insert into zsmslog (zid,xdate,xmobile,xmsg,xtype,zactive,xref,xtrnnum) 
--select 100000,GETDATE(),tr,N'প্রিমিয়ার সিমেন্ট থেকে বিকাশ TrxID '+ xcode + N' ক্যাশ ইন পেয়ে থাকলে Yes এবং না পেলে No লিখে sms করুন','ChallanSMS',0,xcode,'Offersms' from cashdisbursement 


select xdate,xmobile,xmsg,xtype,zactive,xref,xtrnnum from zsmslog where xtrnnum='Offersms' --and zactive=0 and xref='8HH9LWN6SJ'

and xref in (SELECT     xtrnnum  FROM  cashdisbursement where zactive=0)



