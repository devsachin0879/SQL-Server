---------------------------------------------------
----- Stored Procedures with Output Parameters ----
---------------------------------------------------



--To create an SP with output parameter, we use the keywords OUT or OUTPUT.

Create Procedure spGetEmployeeCountByGender
@Gender nvarchar(20), -- input parameter
@EmployeeCount int OUTPUT -- output parameter
AS
BEGIN
	Select @EmployeeCount = COUNT(ID)
	FROM tblEmployee
	WHERE Gender = @Gender
END


--- Execute sp with output parameters

--1:- we need to initialize a variable as output parameter will give something we need to store that valeu in a parameter.
-- datatype of this variable should be same as datatype of datatype of output parameter variable(@EmployeeCount)
--2:- then pass this new variable to sp. We need to specify the OUTPUT keyword.
-- if we don't specify output keyword, the variable will be NULL
--3:- Execute


DECLARE @EmployeeTotal int
EXECUTE spGetEmployeeCountByGender 'Female',@EmployeeTotal OUT
print @EmployeeTotal


DECLARE @EmployeeTotal int
EXECUTE spGetEmployeeCountByGender @EmployeeCount = @EmployeeTotal OUT, @Gender = 'Male'
print @EmployeeTotal


--- Useful system Stored Procedures

--1:- sp_help SP_Name:- View the information about the stored procedure
sp_help spGetEmployeeCountByGender

--2:- sp_helptext SP_Name:- View the Text of the stored procedure
sp_helptext spGetEmployeeCountByGender

--3:- sp_depends SP_Name:- View the dependencies of the stored procedure.
sp_depends spGetEmployeeCountByGender