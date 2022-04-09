------------------------------------------------------------
------------------- Updatable CTE --------------------------
------------------------------------------------------------

--Is it possible to UPDATE a CTE?
--Yes & No, depending on the number of base tables, the CTE is created upon, and the number of base tables affected by the UPDATE statement.


-- create CTE
With Employees_Name_Gender
AS
(
Select ID,Name,Gender FROM tblEmployee
)
Select * FROM Employees_Name_Gender

--update gender = female where id = 1
With Employees_Name_Gender
AS
(
Select ID,Name,Gender FROM tblEmployee
)
Update Employees_Name_Gender SET Gender = 'Female' where ID = 1


--- create CTE with more than 1 base table
With EmployeesByDepartment
AS
(
	Select e.ID,Name,Gender,DepartmentName
	FROM tblEmployee as e
	Inner join tblDepartment as d
	on e.DepartmentId = d.ID
)
Select * FROM EmployeesByDepartment

--- update
-- here update statement affects only one base table to it will work
With EmployeesByDepartment
AS
(
	Select e.ID,Name,Gender,DepartmentName
	FROM tblEmployee as e
	Inner join tblDepartment as d
	on e.DepartmentId = d.ID
)
Update EmployeesByDepartment Set Gender = 'Male' Where ID = 1

--UPDATE the CTE, in such a way, that the update affects both the tables - tblEmployee and tblDepartment
-- it will fail
With EmployeesByDepartment
AS
(
	Select e.ID,Name,Gender,DepartmentName
	FROM tblEmployee e
	Inner join tblDepartment d
	On e.DepartmentId = d.ID
)
Update EmployeesByDepartment
Set Gender = 'Female',DepartmentName = 'IT'
Where ID = 1


--try to UPDATE just the DeptName

With EmployeesByDepartment
as
(
 Select e.ID,Name,Gender,DepartmentName
 from tblEmployee e
 join tblDepartment d
 on e.DepartmentId = d.ID
)
Update EmployeesByDepartment set 
DepartmentName = 'IT' where Id = 1

With EmployeesByDepartment
as
(
 Select e.ID,Name,Gender,DepartmentName
 from tblEmployee e
 join tblDepartment d
 on e.DepartmentId = d.ID
)
Select * FROM EmployeesByDepartment