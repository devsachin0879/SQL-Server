--///////////////////////////////////--
----------- Identity Column -----------
--///////////////////////////////////--


Create Table tblPerson1
(
PersonId INT Identity(1,1) PRIMARY KEY,
Name NVARCHAR(20)
)

Select * FROM tblPerson1


Insert into tblPerson1 Values('Sara')


DELETE FROM tblPerson1 Where PersonId = 1


-- to explicitly supply a value for identity col
--1:- Turn on identity insert
--2:- Insert query specifying the column

SET identity_insert tblPerson1 ON
INSERT INTO tblPerson1 (PersonId,Name) 
Values(1,'John')


-- deleta all rows from tbl and reset identity col values

Delete from tblPerson1 

DBCC CHECKIDENT('tblPerson1',RESEED,0)

Select * FROM tblPerson1

SET identity_insert tblPerson1 OFF
Insert INTO tblPerson1 Values('Will')

