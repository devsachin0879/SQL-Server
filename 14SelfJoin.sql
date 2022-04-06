----------------------------------------
------------ SELF JOIN -----------------
----------------------------------------

Create TABLE tblEmployee1
(
EmployeeID int NOT NULL PRIMARY KEY,
Name nvarchar(50),
ManagerID int
)


Select * FROM tblEmployee1

INSERT INTO tblEmployee1
VALUES(1,'Mike',3),
(2,'Rob',1),(3,'Todd',NULL),(4,'Ben',1),(5,'Sam',1)


--- inner self join 

Select e.Name AS [Employee Name], m.Name as [Manager Name] 
FROM tblEmployee1 as e
Inner join tblEmployee1 as m
on e.ManagerID = m.EmployeeID


--- cross self join 
Select e.Name AS [Employee], m.Name AS [Manager]
FROM tblEmployee1 e
CROSS JOIN tblEmployee1 m