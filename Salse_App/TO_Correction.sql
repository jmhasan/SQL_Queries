
--TO Datetime correction 
select ximtor,xconfirmt,xstatustor from imtor where ximtor='PCMLTO--1220-000226' or ximtor='PCMLTO--1220-000227'
select xdocnum,xtime,xdate from  imtrn where xdocnum='PCMLTO--1220-000226' or xdocnum='PCMLTO--1220-000227'
select xref,xvoucher,xdate from glheader where xref='PCMLTO--1220-000226' or xref='PCMLTO--1220-000227'
