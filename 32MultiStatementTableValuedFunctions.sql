--------------------------------------------------------------
--------- Multi-statement Table Valued Function --------------
--------------------------------------------------------------


--Inline Table Valued Function
CREATE FUNCTION fn_ILTVF_GetEmployees()
Returns Table
AS
Return
(Select Id,Name, CAST(DateOfBirth AS date) AS DOB From tblPerson2)

Select * FROM fn_ILTVF_GetEmployees()



-- Multi-statement Table Valued Function
Create Function fb_MSTVF_GetEmployees()
Returns @Table Table (Id int,Name nvarchar(20),DOB Date)
AS 
BEGIN
	Insert into @Table
	Select Id,Name,Convert(date,DateOfBirth) FROM tblPerson2
	
	Return
END

Select * FROM fb_MSTVF_GetEmployees()