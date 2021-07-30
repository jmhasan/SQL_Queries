
--TO Datetime correction 
select ximtor,xconfirmt,xstatustor from imtor where ximtor='PCMLTO--0721-000065' or ximtor='PCMLTO--0721-000094'
select * from imtdt where ximtor='PCMLTO--0721-000065' or ximtor='PCMLTO--0721-000094'

select zemail,xdocnum,xtime,xdate from  imtrn where xdocnum='PCMLTO--0721-000065' or xdocnum='PCMLTO--0721-000094'

select * from  glheader where xref='PCMLTO--0721-000065' or xref='PCMLTO--0721-000094'
select * from  gldetail where xvoucher in (select xvoucher from  glheader where xref='PCMLTO--0721-000065' or xref='PCMLTO--0721-000094')