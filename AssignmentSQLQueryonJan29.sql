use WFA3DotNet
create table TblCustomer(
	CustomerID Varchar(10) primary key,
	Name varchar(30),
	DOB date,
	city varchar(20)
)
create table TblAccountType(
	TypeCode int primary key,
	TypeDesc  varchar(20)
)
create table TblAccount(
	CustomerID varchar(10) foreign key references TblCustomer(CustomerID),
	AccountNumber varchar(10) primary key,
	AccountTypeCode int foreign key references TblAccountType(TypeCode),
	DateOpened date default getdate(),
	Balence float

)
insert into tblCustomer values ('123456', 'David Letterman', '04-Apr-1949', 'Hartford'); 

insert into tblCustomer values ('123457', 'Barry Sanders', '12-Dec-1967','Detroit'); 

insert into tblCustomer values ('123458', 'Jean-Luc Picard', '9-Sep-1940', 'San Francisco'); 

insert into tblCustomer values ('123459', 'Jerry Seinfeld', '23-Nov-1965','New York City'); 

insert into tblCustomer values ('123460', 'Fox Mulder', '05-Nov-1962', 'Langley'); 

insert into tblCustomer values ('123461', 'Bruce Springsteen', '29-Dec-1960','Camden'); 

insert into tblCustomer values ('123462', 'Barry Sanders', '05-Aug-1974','Martha''s Vineyard'); 

insert into tblCustomer values ('123463', 'Benjamin Sisko', '23-Nov-1955','San Francisco'); 

insert into tblCustomer values ('123464', 'Barry Sanders', '19-Mar-1966','Langley'); 

insert into tblCustomer values ('123465', 'Martha Vineyard', '19-Mar-1963','Martha''s Vineyard'); 

 Select *from tblCustomer


insert into tblAccountType values (1, 'Checking'); 

insert into tblAccountType values (2, 'Saving'); 

insert into tblAccountType values (3, 'Money Market'); 

insert into tblAccountType values (4, 'Super Checking'); 

select * from tblAccountType

insert into tblAccount values 

('123456', '123456-1', 1, '04-Apr-1993', 2200.33); 

insert into tblAccount values 

('123456', '123456-2', 2, '04-Apr-1993', 12200.99); 

 

insert into tblAccount values 

('123457', '123457-1', 3, '01-JAN-1998', 50000.00); 

 

insert into tblAccount values 

('123458', '123458-1', 1, '19-FEB-1991', 9203.56); 

 

insert into tblAccount values 

('123459', '123459-1', 1, '09-SEP-1990', 9999.99); 

insert into tblAccount values 

('123459', '123459-2', 1, '12-MAR-1992', 5300.33); 

insert into tblAccount values 

('123459', '123459-3', 2, '12-MAR-1992', 17900.42); 

insert into tblAccount values 

('123459', '123459-4', 3, '09-SEP-1998', 500000.00); 

 

insert into tblAccount values 

('123460', '123460-1', 1, '12-OCT-1997', 510.12); 

insert into tblAccount values 

('123460', '123460-2', 2, '12-OCT-1997', 3412.33); 

 

insert into tblAccount values 

('123461', '123461-1', 1, '09-MAY-1978', 1000.33); 

insert into tblAccount values 

('123461', '123461-2', 2, '09-MAY-1978', 32890.33); 

insert into tblAccount values 

('123461', '123461-3', 3, '13-JUN-1981', 51340.67); 

 

insert into tblAccount values 

('123462', '123462-1', 1, '23-JUL-1981', 340.67); 

insert into tblAccount values 

('123462', '123462-2', 2, '23-JUL-1981', 5340.67); 

 

insert into tblAccount values 

('123463', '123463-1', 1, '1-MAY-1998', 513.90); 

insert into tblAccount values 

('123463', '123463-2', 2, '1-MAY-1998', 1538.90); 

 

insert into tblAccount values 

('123464', '123464-1', 1, '19-AUG-1994', 1533.47); 

insert into tblAccount values 

('123464', '123464-2', 2, '19-AUG-1994', 8456.47); 

Select * from TblAccount


--Q1. Print customer id and balance of customers who have at least $5000 in any of their accounts.  
select customerid,balence
from TblAccount
where Balence>=5000


--Q2. Print names of customers whose names begin with a ‘B’.  
select name
from TblCustomer
where name like 'B%'


--Q3. Print all the cities where the customers of this bank live.
select city
from TblCustomer


--Q4. Use IN [and NOT IN] clauses to list customers who live in [and don’t live in] San Francisco or Hartford.  

--IN
select t.customerid, t.name, t.city
from TblCustomer t
where t.city in('san francisco', 'Hartford');

--NOT IN
select customerid, name, city
from TblCustomer 
where city not in('san francisco', 'Hartford');


--Q5. Show name and city of customers whose names contain the letter 'r' and who live in Langley.  
select name, city
from TblCustomer
where city='langley' and name like '%r%'


--Q6. How many account types does the bank provide?  
select count(TypeCode) as TotAccountTypes
from TblAccountType


--Q7. Show a list of accounts and their balance for account numbers that end in '-1'  
select AccountNumber,balence
from TblAccount
where AccountNumber like '%-1'


--Q8. Show a list of accounts and their balance for accounts opened on or after July 1, 1990.  
select AccountNumber,DateOpened,balence
from TblAccount
where DateOpened>='01-JUL-1990'


--Q9. If all the customers decided to withdraw their money, how much cash would the bank need?  
select sum(balence) as CashNeed
from TblAccount


--Q10. List account number(s) and balance in accounts held by ‘David Letterman’.
select t1.AccountNumber, t1.balence
from TblAccount t1 join TblCustomer t2
on t1.CustomerID=t2.CustomerID
where t2.name='david letterman'


--Q11. List the name of the customer who has the largest balance (in any account).  
select t2.name
from TblAccount t1 join TblCustomer t2
on t1.CustomerID=t2.CustomerID
where t1.Balence in(
					select max(Balence)
					from TblAccount
					)

--Q12. List customers who have a ‘Money Market’ account.  
select t1.customerid, t1.name
from TblCustomer t1 join TblAccount t2
on t1.CustomerID = t2.CustomerID
where t2.AccountTypeCode in(
							select t2.AccountTypeCode
							from TblAccount join TblAccountType t3
							on t2.AccountTypeCode=t3.TypeCode
							where t3.TypeDesc='Money Market'
)


--Q13. Produce a listing that shows the city and the number of people who live in that city
select city, count(name) as NoOfPeople
from  TblCustomer
group by city


--Q14. Produce a listing showing customer name, the type of account they hold and the balance in that account.   (Make use of Joins) 
select t1.name, t3.typedesc,t2.balence
from TblCustomer t1 join TblAccount t2
on t1.CustomerID=t2.CustomerID
join TblAccountType t3
on t2.AccountTypeCode=t3.TypeCode


--Q15. Produce a listing that shows the customer name and the number of accounts they hold. (Make use of Joins) 
select count(t2.customerid) as NoOfAccountEachHas
from TblCustomer t1 join TblAccount t2
on t1.CustomerID=t2.CustomerID
group by t2.CustomerID

--Q16. Produce a listing that shows an account type and the average balance in accounts of that type. (Make use of Joins) 
select avg(t1.balence) as AvgBalance
from TblAccount t1 join TblAccountType t2
on t1.AccountTypeCode=t2.TypeCode
group by t2.TypeCode

use WFA3DotNet
