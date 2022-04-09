---------------------------------------------------------
------------- Derived Tables and CTEs -------------------
---------------------------------------------------------

Select * FROM tblEmployee
Select * FROM tblDepartment

Select DepartmentName,COUNT(*) AS [Total Employees]
FROM tblEmployee e
INNER JOIN tblDepartment d
on e.DepartmentId = d.ID
GROUP BY DepartmentName
Having COUNT(*) > 2

--- using temp table 
Select DepartmentName,COUNT(*) AS [Total Employees]
INTO #TempEmployeeCount
FROM tblEmployee e
INNER JOIN tblDepartment d
on e.DepartmentId = d.ID
GROUP BY DepartmentName

Select * FROM  #TempEmployeeCount Where [Total Employees] > 2

--- using derived tables
Select DepartmentName,[Total Employees]
FROM 
(
	Select DepartmentName,COUNT(*) AS [Total Employees]
	FROM tblEmployee e
	INNER JOIN tblDepartment d
	on e.DepartmentId = d.ID
	GROUP BY DepartmentName
) AS EmployeeCount
Where [Total Employees] > 2


--- using CTEs
With EmployeeCountNew(DepartmentName,TotalEmployees)
AS
(
	Select DepartmentName,COUNT(*) AS [Total Employees]
	FROM tblEmployee e
	INNER JOIN tblDepartment d
	on e.DepartmentId = d.ID
	GROUP BY DepartmentName
)
Select DepartmentName,TotalEmployees
FROM EmployeeCountNew
Where TotalEmployees > 2