---------------------------------------------------
------ Different ways to replace NULL Values ------
---------------------------------------------------


Select E.Name as [Employee],m.Name AS [Manager]
From tblEmployee1 e
LEFT JOIN tblEmployee1 m
On e.ManagerID = m.EmployeeID


---1:- ISNULL(expression,value)
--- expression:-The expression to test whether is NULL
--- value:-  The value to return if expression is NULL

Select E.Name as [Employee],ISNULL(m.Name,'No Manager')
From tblEmployee1 e
LEFT JOIN tblEmployee1 m
On e.ManagerID = m.EmployeeID


---2:- COALESCE(val1,val2,......valn)
Select COALESCE(NULL,NULL,NULL,'Sachin Dev',NULL,'Manna')

-- if the manager value is null next value will be no manager
Select E.Name as [Employee],COALESCE(m.Name,'No Manager')
From tblEmployee1 e
LEFT JOIN tblEmployee1 m
On e.ManagerID = m.EmployeeID


---3:- CASE Statement

Select 
	E.Name as [Employee],
	CASE
		WHEN m.Name IS NULL THEN 'No Manager' ELSE m.Name
	END
From tblEmployee1 e
LEFT JOIN tblEmployee1 m
On e.ManagerID = m.EmployeeID