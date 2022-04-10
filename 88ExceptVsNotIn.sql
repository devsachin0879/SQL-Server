------------------------------------------------------
------------- Except Vs NOT IN -----------------------
------------------------------------------------------

Select * FROM TableA
Select * FROM TableB


-- Differences
--1:- 1. Except filters duplicates and returns only DISTINCT rows from the left query that aren’t in the right query’s results, 
--where as NOT IN does not filter the duplicates.

Select Id,Name,Gender From TableA
Except
Select Id,Name,Gender From TableB


Select Id,Name,Gender From TableA
Where Id not in (Select Id FROM TableB)

--2. EXCEPT operator expects the same number of columns in both the queries, where as NOT IN, compares a single column from the outer query 
--with a single column from the subquery.


-- these will produce an error
Select Id, Name, Gender From TableA
Except
Select Id, Name From TableB


Select Id, Name, Gender From TableA
Where Id NOT IN (Select Id, Name from TableB)