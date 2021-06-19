select h.xzone,h.xcus,h.xorg, h.xid,xoutletname, 
(select max(xdistrict) from caoutlet where xid=h.xid and xid<>'') District,
 (select max(xthana) from caoutlet where xid=h.xid) xthana,
  (select max(xmobile) from caoutlet where xid=h.xid) xmobile,
   (select max(xaddress) from caoutlet where xid=h.xid) xaddress,
    (select max(xproprietor) from caoutlet where xid=h.xid) xproprietor,
xriid,xname, (select xtsoid from cacushrc where xriid=h.xriid) xtsoid,
 (select xname from prmst  where xemp=(select xtsoid from cacushrc where xriid=h.xriid)) AI_Name, 
(select xziid from cazone where xzone=h.xzone) ZID,
 (select xname from prmst  where xemp=(select xziid from cazone where xzone=h.xzone)) ZI_Name

 from outlettargetf h join cacus c on h.xcus=c.xcus  where H.xzone='MYMENSINGH'

