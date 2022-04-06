--- CREATING TABLE

USE [Sample]
GO

CREATE TABLE tblGender
(
ID int NOT NULL PRIMARY KEY,
Gender nvarchar(50) NOT NULL
)


--/////////////////////////////////--
---------- Foreign Key --------------
--/////////////////////////////////--

-- Syntax:-
-- Alter table ForeignKeyTable Add constraint ForeignKeyTable_ForeignKeyColumn_FK
-- Foreign Key(ForeignKey Column) References PrimaryKeyTable(PrimaryKeyColumn)
Alter Table tblPerson ADD Constraint tblPerson_GenderID_FK
Foreign Key (GenderId) References tblGender(ID)