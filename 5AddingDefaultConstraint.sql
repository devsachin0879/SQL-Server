Select * FROM tblPerson
Select * FROM tblGender

--/////////////////////////////////--
------- insert data to table --------
--/////////////////////////////////--

-- here not adding genderid as it can accept null values
Insert into tblPerson(ID,Name,Email)
Values (7,'Richie','r@r.com')


--- insert multiple values to the table
Insert into tblPerson(ID,Name,Email,GenderId)
VALUES (3,'Simon','s@s.com',1),
	   (4,'Sam','sam@s.com',1),
	   (5,'May',',ay@m.com',2),
	   (6,'Kerry','k@k.com',3)



--//////////////////////////////////////--
------- adding default constraint --------
--//////////////////////////////////////--


-- Syntax:-

-- Altering an existing column to add default const.
-- ALTER TABLE {TABLE_NAME}
-- ADD CONSTRAINT{CONSTRAINT_NAME}
-- DEFAULT{DEFAULT_VALUE} FOR {EXISTING_COLUMN_NAME} 

-- Adding new col, with default value, to an existing tbl
-- ALTER TABLE {TABLE_NAME}
-- ADD {COLUMN_NAME} {DATA_TYPE} {NULL | NOT NULL}
-- CONSTRAINT {CONSTRAINT_NAME} DEFAULT {DEFAULT_VALUE}

-- Dropping a constraint
-- ALTER TABLE {TABLE_NAME}
-- DROP CONSTRAINT {CONSTRAINT_NAME}

Alter Table tblPerson
ADD CONSTRAINT DF_tblPerson_GenderId
DEFAULT 3 FOR GenderId

Insert into tblPerson (ID,Name,Email)
VALUES(8,'Mike','Mike@mike@.com')

Select * FROM tblPerson


--- remove a row from table
DELETE FROM tblPerson
WHERE ID = 7


-- 
Insert into tblPerson (ID,Name,Email,GenderId)
VALUES(9,'Sara','Sara@sara.com',2)
Insert into tblPerson (ID,Name,Email,GenderId)
VALUES(10,'John','John@j.com',NULL)


---- Dropping constraint
Alter Table tblPerson
DROP Constraint DF_tblPerson_GenderId