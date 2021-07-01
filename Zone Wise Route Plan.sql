select xzone,xcus,xorg,xid,xoutletname,xname,xaddress,xthana,xproprietor,(select xmobile from caoutlet where xid=routep.xid) xmobile,xriid,
(select xname from prmst where xemp=routep.xriid) RI_Name,
(select xtsoid from cacushrc where xriid=routep.xriid) AI_ID,
(select xname from prmst where xemp=(select xtsoid from cacushrc where xriid=routep.xriid)) AI_Name,
(select xziid from cacushrc where xriid=routep.xriid) ZI_ID,--(select xname from prmst where xemp=(select xziid from cacushrc where xriid=a.xriid)) ZI_Name,
(select xname from prmst where xemp=(select xziid from cazone where xzone=routep.xzone)) ZI_Name1
 from routep where xzone='DHAKA MIDDLE' order by xday 

