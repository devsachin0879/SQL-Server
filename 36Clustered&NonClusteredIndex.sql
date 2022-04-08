-------------------------------------------------------------------
------------ Clustered and Non Clustered Indexes ------------------
-------------------------------------------------------------------


-- Clustered Index:
--A clustered index determines the physical order of data in a table. For this reason, a table can have only one clustered index.

-- Id column is marked as primary key. Primary key, constraint create clustered indexes automatically if no clustered index already exists 
--on the table and a nonclustered index is not specified when you create the PRIMARY KEY constraint. 
CREATE TABLE [tblUsers]
(
 [Id] int Primary Key,
 [Name] nvarchar(50),
 [Salary] int,
 [Gender] nvarchar(10),
 [City] nvarchar(50)
)

EXEC sp_helpindex [tblUsers]

Insert into tblUsers Values(3,'John',4500,'Male','New York')
Insert into tblUsers Values(1,'Sam',2500,'Male','London')
Insert into tblUsers Values(4,'Sara',5500,'Female','Tokyo')
Insert into tblUsers Values(5,'Todd',3100,'Male','Toronto')
Insert into tblUsers Values(2,'Pam',6500,'Female','Sydney')

Select * FROM tblUsers

-- first delete index on primary key then create it
Create Clustered Index IX_tblUsers_Name
ON [tblUsers](Name)

Select * FROM tblUsers

DROP INDEX tblUsers.IX_tblUsers_Name


--Non Clustered Index:
--A nonclustered index is analogous to an index in a textbook. The data is stored in one place, the index in another place. 
--The index will have pointers to the storage location of the data. Since, the nonclustered index is stored separately from the actual data, 
--a table can have more than one non clustered index, just like how a book can have an index by Chapters at the beginning 
--and another index by common terms at the end.

Create NonClustered Index IX_tblUsers_Name
ON tblUsers(Name)