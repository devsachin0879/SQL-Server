----------------------------------------------------------
--------- Scalar User Defined Functions (UDF) ------------
----------------------------------------------------------


--- 3 Types of UDFs
--a. Scalar functions
--b. Inline table-valued functions
--c. Multistatement table-valued functions 

--Scalar functions may or may not have parameters, but always return a single (scalar) value. The returned value can be of any data type, except text, ntext, image, cursor, and timestamp.

CREATE FUNCTION CalculateAge(@DOB Date)
Returns int
AS
BEGIN
	Declare @Age int

	Set @Age = DATEDIFF(YEAR,@DOB,GETDATE()) - 
				CASE
					WHEN (Month(@DOB) > MONTH(GETDATE())) OR
						 (Month(@DOB) = Month(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
					THEN 1 ELSE 0
				END
	RETURN @Age
END


---  execute
Select [Sample].[dbo].[CalculateAge]('02/10/1998')



Select * FROM tblPerson2

Select Name,DateOfBirth,[dbo].[CalculateAge](DateOfBirth) AS[Age]
FROM tblPerson2


Select Name,DateOfBirth,[dbo].[CalculateAge](DateOfBirth) AS[Age]
FROM tblPerson2
Where [dbo].[CalculateAge](DateOfBirth) > 36



sp_helptext CalculateAge

---convert function to procedure

CREATE PROC spCalculateAge
@DOB Date
AS
BEGIN
	Declare @Age int

	Set @Age = DATEDIFF(YEAR,@DOB,GETDATE()) - 
				CASE
					WHEN (Month(@DOB) > MONTH(GETDATE())) OR
						 (Month(@DOB) = Month(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
					THEN 1 ELSE 0
				END
	Select @Age
END

spCalculateAge '02/10/1998'