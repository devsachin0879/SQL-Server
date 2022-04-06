--------------------------------------------
---------- Union & Union All ---------------
--------------------------------------------

CREATE TABLE tblIndiaCustomer
(
ID int NOT NULL PRIMARY KEY,
Name nvarchar(50),
Email nvarchar(50)
)

CREATE TABLE tblUKCustomer
(
ID int NOT NULL PRIMARY KEY,
Name nvarchar(50),
Email nvarchar(50)
)

INSERT INTO tblIndiaCustomer
VALUES (1,'Raj','r@r.com'),(2,'Sam','s@s.com')


INSERT INTO tblUKCustomer
VALUES(1,'Ben','b@b.com'),(2,'Sam','s@s.com')


Select * FROM tblIndiaCustomer
Select * FROM tblUKCustomer


-- Union
Select ID,Name,Email FROM tblIndiaCustomer
Union
Select ID,Name,Email FROM tblUKCustomer


-- Union All
Select ID,Name,Email FROM tblIndiaCustomer
Union All
Select ID,Name,Email FROM tblUKCustomer