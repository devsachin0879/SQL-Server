---------------------------------------------------------------------
-------------------------- MERGE ------------------------------------
---------------------------------------------------------------------


--Merge statement allows us to perform Inserts, Updates and Deletes in one statement. 
--This means we no longer have to use multiple statements for performing Insert, Update and Delete.

--With merge statement we require 2 tables
--1. Source Table - Contains the changes that needs to be applied to the target table
--2. Target Table - The table that require changes (Inserts, Updates and Deletes)

Create table StudentSource
(
     ID int primary key,
     Name nvarchar(20)
)
GO

Insert into StudentSource values (1, 'Mike')
Insert into StudentSource values (2, 'Sara')
GO

Create table StudentTarget
(
     ID int primary key,
     Name nvarchar(20)
)
GO

Insert into StudentTarget values (1, 'Mike M')
Insert into StudentTarget values (3, 'John')
GO


Select * FROM StudentTarget
Select * FROM StudentSource

--- Merge statement
MERGE StudentTarget as T
Using StudentSource as S
ON T.ID = S.ID
When MATCHED THEN UPDATE SET T.Name = S.Name
When Not Matched By Target Then INSERT(Id,Name) VALUES (S.Id,S.Name) -- if data is not in target table
WHEN NOT Matched By Source Then Delete; -- of data is not in source 

Select * FROM StudentTarget
Select * FROM StudentSource


