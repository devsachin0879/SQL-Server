---------------------------------------------------------
------------------ Recursive CTE ------------------------
---------------------------------------------------------

--A CTE that references itself is called as recursive CTE
--Recursive CTE's can be of great help when displaying hierarchical data.

Create Table tblEmployees
(
  EmployeeId int Primary key,
  Name nvarchar(20),
  ManagerId int
)

Insert into tblEmployees values (1, 'Tom', 2)
Insert into tblEmployees values (2, 'Josh', null)
Insert into tblEmployees values (3, 'Mike', 2)
Insert into tblEmployees values (4, 'John', 3)
Insert into tblEmployees values (5, 'Pam', 1)
Insert into tblEmployees values (6, 'Mary', 3)
Insert into tblEmployees values (7, 'James', 1)
Insert into tblEmployees values (8, 'Sam', 5)
Insert into tblEmployees values (9, 'Simon', 1)

--Since, a MANAGER is also an EMPLOYEE, both manager and employee details are stored in tblEmployee table
Select * FROM tblEmployees

--display, EmployeeName along with their ManagerName

-- using self join 
Select e.Name AS [EmployeeName],ISNULL(m.Name,'Super Boss') AS [ManagerName]
FROM tblEmployees as e
Left join tblEmployees as m
On e.ManagerId = m.EmployeeId