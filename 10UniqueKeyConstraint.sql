-- *********************************** --
--------- Unique Key Constraint ---------
-- *********************************** --

Select * FROM tblPerson

-- Add constraint
ALTER TABLE tblPerson
ADD CONSTRAINT UQ_tblPerosn_Email UNIQUE (Email)

Insert INTO tblPerson Values(12,'abc','a@a.com',1,20)
Insert INTO tblPerson Values(13,'xyz','a@a.com',1,20)


--- Drop constraint
ALTER TABLE tblPerson
DROP CONSTRAINT UQ_tblPerosn_Email