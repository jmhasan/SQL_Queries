
--Don't show in any screen invalid payment
select *,(select email from [user] where UserID=payment.UserID),
(select customername from Customer where CustomerID=payment.CustomerID) from payment
 where BankID=0

--check payment
select (select email from [user] where UserID=payment.UserID),
(select customername from Customer where CustomerID=payment.CustomerID),* from payment
 where RIID=0 and TSOID=0 and ZIID=0 and HOID=0