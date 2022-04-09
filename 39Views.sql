-------------------------------------------------
------------------- VIEW ------------------------
-------------------------------------------------

-- A view is noting more than a saved SQL query. A view can also be considered as a virtual table.

Select * FROM tblEmployee
Select * FROM tblDepartment

-- create view
CREATE VIEW vwEmployeesByDepartment
AS
Select e.ID,Name,Gender,DepartmentName
FROM tblEmployee e
Inner join tblDepartment d
on e.DepartmentId = d.ID

Select * FROM vwEmployeesByDepartment

sp_helptext vwEmployeesByDepartment

CREATE VIEW vwITEmployees
AS
Select e.ID,Name,Gender,DepartmentName
FROM tblEmployee e
Inner join tblDepartment d
on e.DepartmentId = d.ID
Where d.DepartmentName = 'IT'

Select * FROM vwITEmployees

ALTER VIEW vwITEmployees
AS
Select e.ID,Name,Salary,Gender,DepartmentName
FROM tblEmployee e
Inner join tblDepartment d
on e.DepartmentId = d.ID
Where d.DepartmentName = 'IT'

--- view that aggregates data and return them back
Create VIEW vwSalaryByGender
AS
Select Gender,Avg(Salary) AS [Avg Salary]
FROM tblEmployee e
GROUP BY Gender

Select * FROM vwSalaryByGender

Create View vWSummarizeData
AS
Select d.DepartmentName,COUNT(e.ID) AS [TotalEmployees]
FROM tblEmployee e
Inner Join tblDepartment d
ON e.DepartmentId = d.ID
GROUP BY d.DepartmentName

Select * FROM vWSummarizeData