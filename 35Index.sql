------------------------------------------------------------------------
----------------------------- INEDXES ----------------------------------
------------------------------------------------------------------------

Select * FROM tblEmployee Where Salary > 5000 and Salary < 7000
-- To find the employees with salary > 5000 and salary < 7000 the query engine has to check each and every row in the table, resulting in a table scan,
-- which can adversely affect the performance, especially if the table is large.
-- Since, there is no index, to help the query, the query engine performs an entire table scan



-- Create index
Create Index IX_tblEmployee_Salary
ON tblEmployee(Salary ASC)

Select * FROM tblEmployee Where Salary > 5000 and Salary < 7000
-- Now when the SQL server has to execute the same query, it has an index on the salary column to help this query.Salaries b/w range of 5000 and 7000 ae usually
-- present at the bottom, since the salaries are arranged in an ascending order. SQL server picks up the row addresses from the index 
-- and directly fetch the records from the table, rather than scanning each row in the table. This is called index seek.


sp_help tblEmployee

-- drop index
DROP INDEX tblEmployee.IX_tblEmployee_Salary