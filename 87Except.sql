----------------------------------------------
---------------- EXCEPT ----------------------
----------------------------------------------


--EXCEPT operator returns unique rows from the left query that aren’t in the right query’s results.
--The number and the order of the columns must be the same in all queries
--The data types must be same or compatible
--This is similar to minus operator in oracle

Create Table TableA
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableA values (1, 'Mark', 'Male')
Insert into TableA values (2, 'Mary', 'Female')
Insert into TableA values (3, 'Steve', 'Male')
Insert into TableA values (4, 'John', 'Male')
Insert into TableA values (5, 'Sara', 'Female')
Go

Create Table TableB
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into TableB values (4, 'John', 'Male')
Insert into TableB values (5, 'Sara', 'Female')
Insert into TableB values (6, 'Pam', 'Female')
Insert into TableB values (7, 'Rebeka', 'Female')
Insert into TableB values (8, 'Jordan', 'Male')
Go

Select * FROM TableA
Select * FROM TableB

--- extract all rows in tableA but not in tableB
Select Id,Name,Gender FROM TableA
EXCEPT
Select Id,Name,Gender FROM TableB


--- extract all rows in tableB but not in tableA
Select Id,Name,Gender FROM TableB
EXCEPT
Select Id,Name,Gender FROM TableA


--- use except operator on the same table
--- get employees whose salary is b/w 3000 to 5000
Select ID,Name,Gender,Salary FROM tblEmployee Where Salary >= 3000
EXCEPT
Select ID,Name,Gender,Salary FROM tblEmployee Where Salary >= 5000
Order by Name