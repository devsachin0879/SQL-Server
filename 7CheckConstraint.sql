-- Check Constraint
Select * FROM tblGender

--Add constraint
Alter Table tblPerson
ADD Constraint CK_tblPerson_Age CHECK(Age > 0 AND Age < 150)

INSERT INTO tblPerson
VALUES (11,'Dev','dev@d.com',1,24)

-- Drop constraint
Alter Table tblPerson
DROP Constraint CK_tblPerson_Age