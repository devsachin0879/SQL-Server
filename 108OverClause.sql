---------------------------------------------------
------------------ Over Clause --------------------
---------------------------------------------------

-- The OVER clause combined with Partition By is used to break up
-- the data into partitions.
-- The sepcified fncts operates for each partition.

Create Table Employees
(
     Id int primary key,
     Name nvarchar(50),
     Gender nvarchar(10),
     Salary int
)
Go

Insert Into Employees Values (1, 'Mark', 'Male', 5000)
Insert Into Employees Values (2, 'John', 'Male', 4500)
Insert Into Employees Values (3, 'Pam', 'Female', 5500)
Insert Into Employees Values (4, 'Sara', 'Female', 4000)
Insert Into Employees Values (5, 'Todd', 'Male', 3500)
Insert Into Employees Values (6, 'Mary', 'Female', 5000)
Insert Into Employees Values (7, 'Ben', 'Male', 6500)
Insert Into Employees Values (8, 'Jodi', 'Female', 7000)
Insert Into Employees Values (9, 'Tom', 'Male', 5500)
Insert Into Employees Values (10, 'Ron', 'Male', 5000)
Go

Select * FROM Employees

Select 
	Gender,
	COUNT(Gender) AS GenderTotal,
	AVG(Salary) AS AvgSalary,
	Max(Salary) AS MaxSalary,
	Min(Salary) AS MinSalary
From Employees
Group By Gender

--- here we can't pertition it by gender
--Select 
--	Name,
--	Gender,
--	Salary,
--	COUNT(Gender) AS GenderTotal,
--	AVG(Salary) AS AvgSalary,
--	Max(Salary) AS MaxSalary,
--	Min(Salary) AS MinSalary
--From Employees
--Group By Gender,Name,Salary
--Order by Salary

--- use sub query
Select 
	Name,
	Salary,
	E.Gender,
	G.GenderTotal,
	G.AvgSalary,
	G.MaxSalary,
	G.MinSalary
FROM Employees AS E
INNER JOIN
(
Select 
	Gender,
	COUNT(*) AS GenderTotal,
	AVG(Salary) AS AvgSalary,
	MIN(Salary) AS MinSalary,
	Max(Salary) AS MaxSalary
FROM Employees
Group By Gender
) AS G
ON E.Gender = G.Gender
Order By Gender


--- Over clause
Select 
	Name,
	Salary,
	Gender,
	Count(Gender) OVER(Partition By Gender) AS GendersTotal,
	Avg(Salary) Over(Partition By Gender) AS AvgSalary,
	Min(Salary) Over(Partition By Gender) AS MinSalary,
	Max(Salary) Over(Partition By Gender) AS MaxSalary
FROM Employees