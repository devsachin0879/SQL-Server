----------------------------------------
------------ GROUP BY ------------------
----------------------------------------

CREATE TABLE tblCity
(
ID int NOT NULL Primary Key,
Name nvarchar(20) NOT NULL,
Gender nvarchar(20),
Salary int NOT NULL,
City nvarchar(50)
)

Select * FROM tblCity

INSERT INTO tblCity(ID,Name,Gender,Salary,City)
VALUES
(1,'Tom','Male',4000,'London'),
(2,'Pam','Female',3000,'New York'),
(3,'John','Male',3500,'London'),
(4,'Sam','Male',4500,'London'),
(5,'Todd','Male',2800,'Sydney'),
(6,'Ben','Male',7000,'New York'),
(7,'Sara','Female',4800,'Sydney'),
(8,'Valarie','Female',5500,'New York'),
(9,'James','Male',6500,'London'),
(10,'Russell','Male',8800,'London')



--- Group by 
Select Gender,SUM(Salary)
FROM tblCity
GROUP BY Gender


Select City,SUM(Salary)
FROM tblCity
GROUP BY City

Select City,Gender,SUM(Salary)AS [TotalSalary],COUNT(ID) AS [Num of Employees]
FROM tblCity
GROUP BY City,Gender
Order by [Num of Employees] DESC


---Filtering the data
Select City,SUM(Salary) AS [TotalSalary]
FROM tblCity
Where City = 'London'
GROUP BY City


Select City,SUM(Salary) AS [TotalSalary]
FROM tblCity
GROUP BY City
HAVING City = 'London'

Select City,SUM(Salary) AS [TotalSalary]
FROM tblCity
GROUP BY City
HAVING SUM(Salary) >= 10000



--- combine Where and having
Select City,Avg(Salary) AS [Avg Salary]
FROM tblCity
Where Gender = 'Male'
GROUP BY City
HAVING City = 'Sydney'

Select City,AVG(Salary) AS [TAvg Salary]
FROM tblCity
Where Gender = 'Female'
GROUP BY City
HAVING City = 'New York'


Select City,AVG(Salary) AS [Avg Salary]
FROM tblCity
Where Gender = 'Male'
GROUP BY City
HAVING City = 'London'


Select MIN(Salary)
FROM tblCity
WHERE City = 'London' and Gender = 'Male'