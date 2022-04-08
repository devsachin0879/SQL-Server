----------------------------------------------------
----------------- Temporary Table ------------------
----------------------------------------------------

--- create temorary table

---local temp table. Local temp table starts with #
CREATE TABLE #PerosnalDetials(ID int, Name nvarchar(20))

Insert into #PerosnalDetials VALUES(1,'Mike')
Insert into #PerosnalDetials VALUES(2,'John')
Insert into #PerosnalDetials VALUES(3,'Todd')

Select * FROM #PerosnalDetials

--- check if the temp table is created
Select name from tempdb..sysobjects
where name like '#PerosnalDetials%'

--- If the temp table is created inside the Stored procedure, it get's dropped automatically upon the completion of the SP execution.

CREATE PROC spCreateLocalTempable
AS
BEGIN
CREATE TABLE #PerosnalDetials1(ID int, Name nvarchar(20))

Insert into #PerosnalDetials1 VALUES(1,'Mike')
Insert into #PerosnalDetials1 VALUES(2,'John')
Insert into #PerosnalDetials1 VALUES(3,'Todd')

Select * FROM #PerosnalDetials1
END

spCreateLocalTempable
Select * FROM #PerosnalDetials1


--It is also possible for different connections to create a local temp table with the same name.


--- Global Temporary table
 CREATE TABLE ##EmployeeDetails(ID int, Name nvarchar(20))

Select * FROM ##EmployeeDetails

--Global temp tables are visible to all the connections of the sql server, and are only destroyed when the last connection referencing the table is closed.
--Multiple users across multiple connections can have local temp tables with the same name but a global temp table name has to be unique, and if we 
--inspect the name of the global temp table, in the object explorer, there will be no random numbers suffixed at the end if the table name.