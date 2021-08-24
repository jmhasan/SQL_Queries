select xordernum,xzone from opritarget where xyear=2021 and xper=8 and xzone like '%Corporate%' order by xzone

select * from opritargetdt where xyear=2021 and xper=7 AND xzone in (' CHITTAGONG-01 ',' CHITTAGONG-02 ','Corporate CTG')

select * from opritargetdt where xyear=2021 and xper=6 AND xzone in (' CHITTAGONG-02 ')
--update opritargetdt set xzone='CHITTAGONG-02' where xyear=2021 and xper=6 AND xzone in(' CHITTAGONG-02 ')


select distinct xzone from opritargetdt where xyear=2021 and xper=6

select zid,xrow,xordernum,xeinsert into opritarget
SELECT        getdate(), zutime, zid, replace(xordernum,'2103','2104'), 2021, 4, xstatusord,
zemail, xemail, '2021-04-01', 30, xdayscom, xzone, xqtychl, xemp
FROM            opritarget
WHERE        (xyear = 2021) AND (xper = 3)

select xordernum,xzone, xsimcardno,(select xdiv from cazone where xzone=opritargetdt.xzone),
xemp, xempnew, xziid, xempf from
--update opritargetdt set xsimcardno=(select xdiv from cazone where xzone=opritargetdt.xzone) where xyear=2021 and xper=06 
and xziid not in (select xemp from prmst)


select xzone,xqtychl,(select sum(xqty) from  opritargetdt
WHERE xyear = 2021 AND xper = 01 and xordernum=opritarget.xordernum) from 
--update opritarget set xqtychl=(select sum(xqty) from  opritargetdt
WHERE xyear = 2021 AND xper = 06 and xordernum=opritarget.xordernum) where xyear=2021 and xper=06

SELECT        xordernum, xzone, xsimcardno,'9' + substring(xemp, 2, len(xemp)-1),
                             (SELECT        xdiv
                               FROM            cazone
                               WHERE        (xzone = opritargetdt.xzone)) AS Expr1, xemp, xempnew, xziid, xempf
FROM        opritargetdt
WHERE        (xyear = 2021) AND (xper = 06) AND xzone in()


	  -- update  opritargetdt set xemp='9' + substring(xemp, 2, len(xemp)-1)

select *  from opritargetdt   where xyear=2021 and xper=5 and xemp='002008'

SELECT        zid,xrow,xordernum,xzone, xemp, xempnew,   xziid, xqty,xamount,  xyear, xper, xdayspay
FROM            opritargetdt where xyear=2021 and xper=5