-- Get Last generated Identity Column

CREATE TABLE Test1
(
ID int Identity(1,1),
VALUE NVARCHAR(20)
)

CREATE TABLE Test2
(
ID int Identity(1,1),
VALUE NVARCHAR(20)
)

Select * FROM Test2

Insert into Test1 Values('Y')
Select * FROM Test1


-- SCOPE_IDENTITY:- Generate last identity col value within same session and same scope
Select SCOPE_IDENTITY()


-- @@IDENTITY:- Generate last identity col value within same session and across any scope
SELECT @@IDENTITY

--IDENT_CURRENT('TableName'):- Generate last identity col value for specific tableaccross any session and anyscope
SELECT IDENT_CURRENT('Test1')

-- A scope is a module: a stored procedure, trigger, 
--function, or batch. 
--Therefore, if two statements are in the same 
--stored procedure, function, or batch, 
--they are in the same scope.