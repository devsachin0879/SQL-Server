--------------------------------------
------------ COALESCE ----------------
--------------------------------------

CREATE TABLE tblTest
(
ID int NOT NULL PRIMARY KEY,
FirstName NVARCHAR(50),
MiddleName NVARCHAR(50),
LASTNAME NVARCHAR(50)
)

INSERT INTO tblTest
VALUES(1,'Sam',NULL,NULL),(2,NULL,'Todd','Tanzan'),
(3,NULL,NULL,'Sara'),(4,'Ben','Parker',NULL),(5,'James','Nick','Nancy')

Select * FROM tblTest


--- COALESCE
--  If an employee, has all the columns filled - First, Middle and Last Names, then we only want the first name.

Select COALESCE(FirstName,MiddleName,LastName) AS [Name]
FROM tblTest
