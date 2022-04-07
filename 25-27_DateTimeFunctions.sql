------------------------------------------------
------------ DateTime Functions ----------------
------------------------------------------------


CREATE TABLE [tblDateTime]
(
 [c_time] [time](7) NULL,
 [c_date] [date] NULL,
 [c_smalldatetime] [smalldatetime] NULL,
 [c_datetime] [datetime] NULL,
 [c_datetime2] [datetime2](7) NULL,
 [c_datetimeoffset] [datetimeoffset](7) NULL
)

INSERT INTO tblDateTime VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE())
Select * FROM [tblDateTime]


--1:- GETDATE():- Return current daatabase systesm date and time, in 'YYYY-MM-DD hh:mm:ss.mmm'format
Select GETDATE()

--2:- CURRENT_TIMESTAMP:- Returns the current date and time in a 'YYYY-MM-DD hh:mm:ss.mmm' format
SELECT CURRENT_TIMESTAMP

--3:- SYSDATETIME():- Returns a value of DateTime2 that represents the current system date and time of the server on which SQL server instance is running.
SELECT SYSDATETIME()

--4:- SYSDATETIMEOFFSET():- Returns a value of DATETIMEOFFSET() that represents the current system date and time, which also includes the timezone,of the computer on which SQL instance is running.
SELECT SYSDATETIMEOFFSET()

--5:- GETUTCDATE():- Returns the current database system UTC date and time, in a 'YYYY-MM-DD hh:mm:ss.mmm'format
SELECT GETUTCDATE()

--6:- SYSUTCDATETIME():- returns a value of DATETIME2 that represents the current system date and time of the server on which the SQL Server instance is running. The DateTime in UTC
Select SYSUTCDATETIME()

--7:- ISDATE():- CHecks if the given date,time or datetime is valid. Returns 1 for success, 0 for failure.
-- for DATETIME2 datatype values, ISDATE returns .
Select ISDATE('DEV')
Select ISDATE('10-02-2012')
SELECT ISDATE(GETDATE())

--8:- DAY():- Returns the day number of the month, of given date
Select DAY(GETDATE())
Select Day('01-31-2013')

--9:- MONTH():- Returns the month number of the year, of given date
Select MONTH(GETDATE())
Select MONTH('01-31-2013')

--10:- YEAR():- Returns the year number of given date
SELECT YEAR(GETDATE())
SELECT YEAR('01-31-2013')

--11:- DateName(Datepart,Date):- Returns a string, that represents a part of the given date. This functions takes 2 parameters. The first parameter 'DatePart' specifies, the part of the date, we want. The second parameter, is the actual date, from which we want the part of the Dat
Select 
	DATENAME(YY,GETDATE())[year], 
	DATENAME(YYYY,GETDATE())[year],-- year
	DATENAME(MONTH,GETDATE())[month], -- Month
	DATENAME(qq,GETDATE())[quarter],-- quarter
	DATENAME(q,GETDATE())[quarter],--quarter
	DATENAME(dy,GETDATE())[day of the year], -- day of the year
	DATENAME(y,GETDATE())[day of the year], -- day of the year
	DATENAME(WK,GETDATE())[week], -- week 
	DATENAME(ww,GETDATE())[week], -- week
	DATENAME(dw,GETDATE())[weekday], -- weekday
	DATENAME(hh,GETDATE())[hour],-- hour
	DATENAME(mi,GETDATE())[minute], -- minute
	DATENAME(n,GETDATE())[minute],--minute
	DATENAME(ss,GETDATE())[second], -- second
	DATENAME(s,GETDATE())[second],-- second
	DATENAME(ms,GETDATE())[millisecond], -- millisecond
	DATENAME(mcs,GETDATE())[microsecond],-- microseconds
	DATENAME(ns,GETDATE())[nanosecond]-- nanosecond


CREATE TABLE tblPerson2
(
Id int NOT NULL PRIMARY KEY,
Name nvarchar(20),
DateOfBirth Datetime
)

INSERT INTO tblPerson2
VALUES(1,'Sam','1980-12-30 00:00:00.000'),
(2,'Pam','1982-09-01 12:02:36.260'),
(3,'john','1985-08-22 12:03:30.370'),
(4,'Sara','1979-11-29 12:59:30.670')

Select * FROM tblPerson2

Select 
	Name,
	DateOfBirth,
	DATENAME(WEEKDAY,DateOfBirth) AS [Day],
	DATENAME(MONTH,DateOfBirth) AS [Month],
	YEAR(DateOfBirth) AS [year]
FROM tblPerson2


--12:- DATEPART(DatePart,Date):- Returns an integer representing the specified DatePart. This function is simialar to DateName(). DateName() returns nvarchar, where as DatePart() returns an integer

Select 
	DATEPART(YEAR,GETDATE()) AS [year],
	DATEPART(YYYY,GETDATE()) AS [year],
	DATEPART(YY,GETDATE()) AS [year],
	DATEPART(MONTH,GETDATE()) AS [month],
	DATEPART(MM,GETDATE()) AS [month],
	DATEPART(M,GETDATE()) AS [month],
	DATEPART(DAYOFYEAR,GETDATE()) AS [Day of the year],
	DATEPART(dd,GETDATE()) AS [Day of the year],
	DATEPART(D,GETDATE()) AS [Day of the year],
	DATEPART(WEEK,GETDATE()) AS [Week],
	DATEPART(WK,GETDATE()) AS [Week],
	DATEPART(WW,GETDATE()) AS [Week],
	DATEPART(WEEKDAY,GETDATE()) AS [WeekDay],
	DATEPART(DW,GETDATE()) AS [WeekDay],
	DATEPART(W,GETDATE()) AS [WeekDay],
	DATEPART(HOUR,GETDATE()) AS [Hour],
	DATEPART(HH,GETDATE()) AS [Hour],
	DATEPART(MINUTE,GETDATE()) AS [Minute],
	DATEPART(MI,GETDATE()) AS [Minute],
	DATEPART(N,GETDATE()) AS [Minute],
	DATEPART(SECOND,GETDATE()) AS [Second],
	DATEPART(SS,GETDATE()) AS [Second],
	DATEPART(S,GETDATE()) AS [Second],
	DATEPART(MILLISECOND,GETDATE()) AS [MilliSecond],
	DATEPART(MS,GETDATE()) AS [MilliSecond],
	DATEPART(MICROSECOND,GETDATE()) AS [MicroSecond],
	DATEPART(MS,GETDATE()) AS [MicroSecond],
	DATEPART(NANOSECOND,GETDATE()) AS [NanoSecond],
	DATEPART(NS,GETDATE()) AS [NanoSecond],
	DATEPART(ISO_WEEK,GETDATE()) AS [ISO Week],
	DATEPART(ISOWK,GETDATE()) AS [ISO Week],
	DATEPART(ISOWW,GETDATE()) AS [ISO Week]



--13:- DATEADD(Datepart,NumToAdd,Date):- Returns the DateTime, after adding specified NumberToAdd, to the datepart specified of the given date.
SELECT DATEADD(DAY,20,GETDATE())
Select DATEADD(MM, 9, GETDATE())
Select DATEADD(YY, -10, GETDATE())


--14:- DATEDIFF(Datepart,StartDate,endDate):- Returns the count of the specified datepart boundaries crossed between the specified startdate and enddate.
Select DATEDIFF(MONTH,'11/30/2005','01/31/2006')
Select DATEDIFF(DAY,'11/30/2005','01/31/2006')
Select DATEDIFF(WW,'11/30/2005','01/31/2006')
Select DATEDIFF(MI,'04/06/2022',GETDATE())



--- get age 
Declare @DOB datetime, @tempdate datetime, @years int, @months int, @days int
SET @DOB = '08/10/1998'

Select @tempdate = @DOB

Select @years = DATEDIFF(YEAR,@tempdate,GETDATE()) - 
				CASE
					WHEN (MONTH(@DOB) > MONTH(GETDATE())) OR
					(MONTH (@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE()))
					THEN 1 ELSE 0
				END
Select @tempdate = DATEADD(YEAR,@years,@tempdate)

Select @months = DATEDIFF(MONTH,@tempdate,GETDATE()) - 
				 CASE
					WHEN DAY(@DOB) > DAY(GETDATE())
					THEN 1 ELSE 0
				 END
Select @tempdate = DATEADD(MONTH, @months, @tempdate)

Select @days = DATEDIFF(DAY, @tempdate, GETDATE())

Select @years AS Years, @months AS Months, @days AS [Days]