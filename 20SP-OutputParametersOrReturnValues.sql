----------------------------------------------------
------ SP Ouptut Parameters OR Return Values -------
----------------------------------------------------


-- Whenever we execute a SP, it returns an INT status variable.
-- 0 indicates success and non-zero indicates failure.


-- SP1- ouput parameter
Create PROC spGetTotalCountOfEmployees1
@TotalCount int output
AS
BEGIN
	Select @TotalCount = COUNT(ID)
	From tblEmployee
END

-- execute SP1- ouput parameter
Declare @TotalEmployees int
EXEC spGetTotalCountOfEmployees1 @TotalEmployees out
Select @TotalEmployees



-- SP1- return value
Create PROC spGetTotalCountOfEmployees2
AS 
BEGIN
 return(Select Count(ID) FROM tblEmployee)
END

-- execute SP1- return value
Declare @TotalEmployees int
EXEC @TotalEmployees = spGetTotalCountOfEmployees2
SELECT @TotalEmployees


---- try to output and return nvarchar
-- output should work but return will give an error
-- as return will try to convert nvarchar to int


-- SP2 output parameter
CREATE PROC spGetNameById
@Id int,
@Name nvarchar(50) OUTPUT
AS
BEGIN
	Select @Name = Name
	FROM tblEmployee
	Where ID = @Id
END

-- execute SP2 output parameter
Declare @EmployeeName nvarchar(50)
Exec spGetNameById 3,@EmployeeName Out
Print 'Name = '+ @EmployeeName



-- SP2 Return values
CREATE PROC spGetNameById2
@Id int
AS
BEGIN
	return(Select Name from tblEmployee Where ID = @Id)
END

-- execute SP2 Return values
DECLARE @EmployeeName nvarchar(50)
Exec @EmployeeName = spGetNameById2 1
Print 'Name = ' + @EmployeeName