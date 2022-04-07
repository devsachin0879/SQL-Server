--------------------------------------------------------
-------------- CAST & CONVERT FUNCTION -----------------
--------------------------------------------------------

--To convert one data type to another, CAST and CONVERT functions can be used.

Select * FROM tblPerson2

Select Id,Name,CAST(DateOfBirth AS nvarchar) AS ConvertedDOB 
FROM tblPerson2

Select Id,Name,CONVERT(nvarchar,DateOfBirth) AS ConvertedDOB 
FROM tblPerson2

Select Id,Name,CONVERT(nvarchar,DateOfBirth,103) AS ConvertedDOB 
FROM tblPerson2

Select Id,Name,CONVERT(nvarchar,DateOfBirth,101) AS ConvertedDOB 
FROM tblPerson2


Select CONVERT(VARCHAR(10),GETDATE(),101)

Select CAST(GETDATE() AS DATE)
Select CONVERT(date,GETDATE())

Select Id,Name, Name + '-' + CAST(Id as nvarchar) AS [Name-Id]
FROM tblPerson2