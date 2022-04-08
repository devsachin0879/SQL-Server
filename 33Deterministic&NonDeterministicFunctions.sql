------------------------------------------------------------
----- Deterministic and Nondeterministic Functions: --------
------------------------------------------------------------


--Deterministic functions always return the same result any time they are called with a specific set of input values and given the same state of the database. 
--Examples: Sum(), AVG(), Square(), Power() and Count()

--Note: All aggregate functions are deterministic functions.

--Nondeterministic functions may return different results each time they are called with a specific set of input values even if the database state that they access remains the same.
--Examples: GetDate() and CURRENT_TIMESTAMP

--Rand() function is a Non-deterministic function, but if you provide the seed value, the function becomes deterministic, as the same value gets returned for the same seed value.