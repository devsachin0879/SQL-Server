------------------------------------------------------------------------------------
---------------------- Unique & Non-Unique Indexes ---------------------------------
------------------------------------------------------------------------------------

---- UNIQUE INDEX
-- It is used to enforce uniqueness of the key values in the index.
-- Uniqueness is a property of an Index and both clusteredd and non-clustered indexes can be unique.


-- Since, we have marked Id column, as the Primary key for this table, a UNIQUE CLUSTERED INDEX gets created on the Id column, 
-- with Id as the index key. 
CREATE TABLE tblEmployeeNew
(
 [Id] int Primary Key,
 [FirstName] nvarchar(50),
 [LastName] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
)

-- The following insert queries will fail
-- Since, we now have a UNIQUE CLUSTERED INDEX on the Id column, any attempt to duplicate the key values, will throw an error.
Insert into tblEmployeeNew Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployeeNew Values(1,'John', 'Menco',2500,'Male','London')

EXECUTE sp_helpindex tblEmployeeNew

-- delete Unique Clustered Index from object explorer
-- now following queries will work
Insert into tblEmployeeNew Values(1,'Mike', 'Sandoz',4500,'Male','New York')
Insert into tblEmployeeNew Values(1,'John', 'Menco',2500,'Male','London')

Select * FROM tblEmployeeNew

--UNIQUENESS is a property of an Index, and both CLUSTERED and NON-CLUSTERED indexes can be UNIQUE.
Create Unique NonClustered Index UIX_tblEmployeeNew_FirstName_LastName
On tblEmployeeNew(FirstName, LastName)

Insert into tblEmployeeNew Values(3,'John', 'Menco',5000,'Male','Sydney')