select xordernum,xsornum,xvehicle,xtwh,xqtyord,xrate,xprime,xbase,xstatusord,
(select ximtrnnum from vmfuelitem where xordernum=vmrepmaint.xordernum) from vmrepmaint 
where xordernum='PCMLFTCN0619-003471'

select xordernum,xitem,xqtyord,xrate,xamount,ximtrnnum from vmfuelitem where xordernum='PCMLFTCN0619-003264'

select ximtmptrn,xref,xvehicle,xwh,xstatustrn from imtemptrn where ximtmptrn='PCMLSR--1019-002287'

select ximtmptrn,xitem,xqtyord,xqtyreq from imtemptdt where ximtmptrn='PCMLDSR-0719-000308' or  
ximtmptrn='PCMsssLDSR-0619-002286'
select xsornum,xvehicle,zid,dumzid from vmmovereg where xsornum='PCMLMOV-0619-004937'

select * from imtrn where xdocnum='PCMLDSR-0619-002265'
select * from glheader where xref='PCMLDSR-0619-002265'
select * from gldetail where xvoucher='PCMLSRJV0619-004906'

--To check the FTCN and SR and  Move

select fh.xordernum,fh.xsornum,fh.xvehicle,fh.xtwh,fh.xqtyord,fh.xrate,fh.xprime,fh.xbase,fh.xstatusord,
fd.xordernum,fd.xitem,fd.xqtyord,fd.xrate,fd.xamount,fd.ximtrnnum,srh.ximtmptrn,srh.xref,srh.xvehicle,srh.xwh,srh.xstatustrn,
 srd.ximtmptrn,srd.xitem,srd.xqtyord,srd.xqtyreq,v.xsornum,v.xvehicle from  vmrepmaint fh join vmfuelitem fd on fh.xordernum=fd.xordernum 
join imtemptrn srh on fd.ximtrnnum=srh.ximtmptrn join imtemptdt srd on srh.ximtmptrn=srd.ximtmptrn
 join vmmovereg v on v.xsornum=fh.xsornum where fh.xordernum='PCMLFTCN0519-003006'





