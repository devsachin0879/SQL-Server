------------------------------------
---------- ADVANCED JOINS ----------
------------------------------------

--Retrieve only the non matching rows from the left table
Select Name,Gender,Salary,DepartmentName
FROM tblEmployee e
LEFT JOIN tblDepartment d
ON e.DepartmentId = d.ID
WHERE e.DepartmentId IS NULL

--Retrieve only the non matching rows from the right table
Select Name,Gender,Salary,DepartmentName
FROM tblEmployee e
RIGHT JOIN tblDepartment d
ON e.DepartmentId = d.ID
WHERE e.DepartmentId IS NULL


--Retrieve only the non matching rows from both the left and right table
Select Name,Gender,Salary,DepartmentName
FROM tblEmployee e
FULL OUTER JOIN tblDepartment d
ON e.DepartmentId = d.ID
WHERE e.DepartmentId IS NULL or d.ID IS NULL

