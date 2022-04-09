------------------------------------------------------
--------------- Updatable Views ----------------------
------------------------------------------------------

-- create view
Create View vwEmployeesDataExceptSalary
AS
Select Id,Name,Gender,DepartmentId
FROM tblEmployee

Select * FROM vwEmployeesDataExceptSalary

--update view
Update vwEmployeesDataExceptSalary
Set Name = 'Mike' Where id = 4

-- delete from view 
Delete from vwEmployeesDataExceptSalary where id = 4

-- insert into view
insert into vwEmployeesDataExceptSalary 
Values (4,'Mikey','Male',2)

Select * FROM vwEmployeesDataExceptSalary


--- view that join tables
Create view vwEmployeeDetailsByDepartment
AS
Select e.ID,Name,Salary,Gender,DepartmentName
FROM tblEmployee e
Inner join  tblDepartment d
On e.DepartmentId = d.ID

Select * FROM vwEmployeeDetailsByDepartment

-- change john's department from IT to HR
Update vwEmployeeDetailsByDepartment
SET DepartmentName = 'HR' where Name = 'John'

--- now all the IT department name is changed to HR 
--- data is changed in department table also
Select * FROM tblEmployee
Select * FROM tblDepartment


--The UPDATE statement, updated DeptName from HR to IT in tblDepartment table, instead of upadting DepartmentId column in tblEmployee table.
-- If a view is based on multiple tables, and if you update the view, it may not update the underlying base tables correctly. 
--To correctly update a view, that is based on multiple table, INSTEAD OF triggers are used.
