--------------------------------------------------------------
---------------- Common Table Expressions --------------------
--------------------------------------------------------------

--A CTE is a temporary result set, that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement, 
--that immediately follows the CTE.

Select * FROM tblEmployee


With EmployeeCount(DepartmentId,[Total Employees])
AS
(
Select DepartmentId,COUNT(ID) AS [Total Employees]
FROM tblEmployee
GROUP BY DepartmentId
)
Select d.DepartmentName,e.[Total Employees]
FROM EmployeeCount e
Inner join tblDepartment d
On e.DepartmentId = d.ID
Order by [Total Employees]


---- create multiple CTE's using single WITH clause
With EmployeesCountBy_Payroll_IT_Dept(DeptName, TotalEmp)
AS
(
Select DepartmentName,COunt(e.ID) AS [Total Employees]
FROM tblEmployee e
Inner join tblDepartment d
on e.DepartmentId = d.ID
Where DepartmentName IN ('Payroll','IT')
Group by DepartmentName
),
EmployeesCountBy_HR_Dept(DeptName, TotalEmp)
AS
(
Select DepartmentName,COunt(e.ID) AS [Total Employees]
FROM tblEmployee e
Inner join tblDepartment d
on e.DepartmentId = d.ID
Where DepartmentName = 'HR'
Group by DepartmentName
)
Select * FROM EmployeesCountBy_Payroll_IT_Dept
Union ALL
Select * FROM EmployeesCountBy_HR_Dept