select sum((case when xprime>0 then xprime else 0 end)) Debit,
sum((case when xprime<0 then 0-xprime else 0 end)) credit
 from glheader h join gldetail d on h.zid=d.zid and h.xvoucher=d.xvoucher
join cacus c on c.zid=d.zid and c.xcus=d.xsub
where xtrngl<>'OB--' and xpostflag='Posted' and xsimcardno='Corporate'
and h.xdate between '2012-07-01' and '2020-02-01'

select sum((case when xprime>0 then xprime else 0 end)) Debit,
sum((case when xprime<0 then 0-xprime else 0 end)) credit
 from glheader h join gldetail d on h.zid=d.zid and h.xvoucher=d.xvoucher
join cacus c on c.zid=d.zid and c.xcus=d.xsub
where xtrngl<>'OB--' and xpostflag='Posted' and xsimcardno='Corporate'
and  convert(date,h.xdate) between '2012-07-01' and '2020-02-01'

select sum((case when xprime>0 then xprime else 0 end)) Debit,
sum((case when xprime<0 then 0-xprime else 0 end)) credit
 from glheader h join gldetail d on h.zid=d.zid and h.xvoucher=d.xvoucher
join cacus c on c.zid=d.zid and c.xcus=d.xsub
where xtrngl<>'OB--' and xpostflag='Posted' and xsimcardno='Corporate'
and  convert(date,h.xdate) between '2016-01-01' and '2020-02-01'