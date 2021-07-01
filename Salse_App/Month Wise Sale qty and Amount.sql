select xcus,xorg,h.xwh,xzone,xdistrict,xitemold,
sum(case when xper=11 then xqtychl else 0 end)/20 Nov_20,
sum(case when xper=11 then xlineamt else 0 end) Nov_20_amnt,
sum(case when xper=12 then xqtychl else 0 end)/20 Dec_20,
sum(case when xper=12 then xlineamt else 0 end) Dec_20_amnt,
sum(case when xper=01 then xqtychl else 0 end)/20 Jan_21,
sum(case when xper=01 then xlineamt else 0 end) Jan_21_amnt from opchallandt h join caitem c on h.zid=c.zid and h.xitem=c.xitem
where xstatuschl<>'1-Open' and h.xdiv<>'Bag Plant' and xdelivery='Customer' and xdatecom>='2020-11-01' 
group by xcus,xorg,h.xwh,xzone,xdistrict,xitemold