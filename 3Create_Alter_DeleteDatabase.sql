-- Create a database
Create Database Sample

--- Change name of the database
Alter Database Sample Modify Name = Sample2
--------------- OR ------------------------
Execute sp_renameDB 'Sample','Sample2'

-- Delete database
DROP DATABASE Sample