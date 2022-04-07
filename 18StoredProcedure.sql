--------------------------------------------
------------ STORED PROCEDURE --------------
--------------------------------------------

-- A stored procedure is group of T-SQL (Transact SQL)statements. 
--If you have a situation, where you write the same query over and over again, you can save that specific query as a stored procedure and call it just by it's name

Select * FROM tblEmployee


-- Create stored procedure
Create Procedure spGetEmployees -- or Create PROC
AS
BEGIN
	Select Name,Gender FROM tblEmployee
END


-- Execute procedure

--1:- just wirte name of stored procedure
spGetEmployees

--2:- Use EXEC
EXEC spGetEmployees

--3:- Use EXECUTE
EXECUTE spGetEmployees


--- Create procedure with input parameters.
CREATE PROC spGetEmployeesByGenderAndDepartment
@abc nvarchar(20),@xyz int
AS
BEGIN
	Select Name,Gender
	From tblEmployee
	Where Gender = @abc AND DepartmentId = @xyz
END

spGetEmployeesByGenderAndDepartment 'Male',1


---ALter procedure
Alter PROC spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),@DepartmentId int
AS
BEGIN
	Select Name,Gender
	From tblEmployee
	Where Gender = @Gender AND DepartmentId = @DepartmentId
	Order by Name
END

spGetEmployeesByGenderAndDepartment @DepartmentId = 1,@Gender='Male'


-- View text of procedure
sp_helptext spGetEmployees


-- encrypt the text of a sp
-- use with encryption
Alter PROC spGetEmployeesByGenderAndDepartment
@Gender nvarchar(20),@DepartmentId int
WITH ENCRYPTION
AS
BEGIN
	Select Name,Gender
	From tblEmployee
	Where Gender = @Gender AND DepartmentId = @DepartmentId
	Order by Name
END


-- Delete Stored procedure
DROP PROC spGetEmployees