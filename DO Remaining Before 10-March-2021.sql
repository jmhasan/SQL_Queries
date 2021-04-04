select h.xcus,h.xorg,h.xzone,sum(xqty-xqtychl)/20 DoRembefore10march,
(select sum(xqty-xqtychl)/20 from opdorddt where xqty-xqtychl>0 and xcus=h.xcus) tilldateRem from opdorddt h join cacus c on h.zid=c.zid and h.xcus=c.xcus where
c.xprbasicapp='Yes' and xconfirmt<='2021-03-10 06:00' and xqty-xqtychl>0--- and h.xcus='CUS-000143'
group by h.xcus,h.xorg,h.xzone

