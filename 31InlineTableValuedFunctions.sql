--------------------------------------------------------
------------- Inline Table Valued Functions ------------
--------------------------------------------------------

CREATE FUNCTION fnEmployeesByGender(@Gender nvarchar(10))
RETURNS TABLE
AS
RETURN (Select ID,Name,Gender,DepartmentId 
	From tblEmployee 
	Where Gender = @Gender)

--- call the function
Select * FROM fnEmployeesByGender('Male')

---use inline table with other table 
Select Name,Gender,DepartmentName
FROM fnEmployeesByGender('Male') E
Inner Join tblDepartment D
on E.DepartmentId = D.ID

Select * FROM tblDepartment