select xzonedel,xcus,dbo.cusname(xcus),xwh,xadvnum,xsmstypecat,xqtysms/20,xdelivery,xcartype,
ztime Justify_Time,xconfirmt Create_Time,xstatusadvmach
 from opadvice where xconfirmt>='2020-11-30 06:00' and xconfirmt<>'2999-12-31 00:00:00.000'