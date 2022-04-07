----------------------------------------------
------- Built in String Functions ------------
----------------------------------------------


--1:- ASCII(char_expression):- Returns ASCII code of given character expression.
Select ASCII('A'),ASCII('a'),ASCII('Z'),ASCII('z')

--2:- CHAR(int_expr):- Convert INT ASCII code to a character.
Declare @Number int
SET @Number = 1
WHILE (@Number<255)
BEGIN
	Print 'Character = ' + CHAR(@Number)
	Set @Number = @Number + 1
END

--char with lower
Declare @Number int
SET @Number = 65
WHILE (@Number<=90)
BEGIN
	Print 'Character = ' + Lower(CHAR(@Number))
	Set @Number = @Number + 1
END

--3:- LTRIM(char_exp):- Removes blanks on left handside of the given character expression.
SELECT LTRIM('        Hello')

--4:- LTRIM(char_exp):- Removes blanks on right handside of the given character expression.
Select RTRIM('Hello           ')

-- remove spaces from either side 
Select LTRIM(RTRIM('     Hello     '))
SELECT LEN(LTRIM(RTRIM('     Hello     ')))

--5:- LOWER(char_exp):- converts all chars in the given char_exp to lowercase letters
Select Lower('My Name is Sachin Dev')

--6:- Upper(char_exp):- converts all chars in the given char_exp to uppercase letters
Select Upper('My Name is Sachin Dev')

--7:- REVERSE('Any_String_Expression') - Reverses all the characters in the given string expression.
Select REVERSE('Sachin Dev')
Select Reverse('ABCDEFGHIJKLMNOPQRSTUVWXYZ')

--8:- LEN(str_exp):-  Returns the count of total characters, in the given string expression, excluding the blanks at the end of the expression.
Select LEN('ABCDEFGHIJKLMNOPQRSTUVWXYZ')

--9:- LEFT(char_exp,int_exp):- Returns the specified num of chars from the left side of the goven character.
Select LEFT('ABCDEFGHIJ',5)
Select LEFT('ABCDEFGHIJ',2)

--10:- Right(char_exp,int_exp):- Returns the specified number of characters from the right hand side of the given character expression.
Select RIGHT('ABCDEFGHIJ',5)
Select RIGHT('ABCDEFGHIJ',2)

--11:- CHARINDEX('Expression_To_Find', 'Expression_To_Search', 'Start_Location') - Returns the starting position of the specified expression in a character string. Start_Location parameter is optional.
Select CHARINDEX('@','sara@aaaa.com',1)

-- combine left,right,charindex
-- get string String Functions
Declare @mystring nvarchar(50)
Set @mystring = 'Sql Server - Stored Procedures - String Functions'
Select RIGHT(@mystring,LEN(@mystring) - CHARINDEX('-',@mystring,CHARINDEX('-',@mystring)+1)-1)


--12:- Substring('exp','start','length'):- this function returns substring (part of the string), from the given expression
Select SUBSTRING('John@bbb.com',6, 7)


--13:- REPLICATE(String_To_Be_Replicated, Number_Of_Times_To_Replicate) - Repeats the given string, for the specified number of times.
Select Replicate('Dev',5)
Select * From tblPerson

Select Name,SUBSTRING(Email, 1, 2) + REPLICATE('*',5) + 
SUBSTRING(Email, CHARINDEX('@',Email), LEN(Email) - CHARINDEX('@',Email)+1) as Email
from tblPerson

--14:- SPACE(Number_Of_Spaces) - Returns number of spaces, specified by the Number_Of_Spaces argument.
Select 'Sachin' + SPACE(20) + 'Dev' AS [FullName]

--15:- PATINDEX('%Pattern%', Expression): Returns the starting position of the first occurrence of a pattern in a specified expression. It takes two arguments, the pattern to be searched and the expression. PATINDEX() is simial to CHARINDEX(). With CHARINDEX() we cannot use wildcards, where as PATINDEX() provides this capability. If the specified pattern is not found, PATINDEX() returns ZERO.
Select Email, PATINDEX('%aaa.com',Email) as [First Occirence]
From tblEmail
WHERE PATINDEX('%aaa.com',Email) > 0

--16:-  REPLACE(str_exp,Pattern,Replacement_value):- Replaces all occurrences of a specified string value with another string value

Select REPLACE('ababababa','a','c')
Select Email,REPLACE(Email,'.com','.net')
FROM tblEmail


--17:- STUFF(Original_Expression, Start, Length, Replacement_expression)
--STUFF() function inserts Replacement_expression, at the start position specified, along with removing the charactes specified using Length parameter.

Select FirstName,LastName,Email,STUFF(Email,2,3,'*****') AS StuffedEmail
FROM tblEmail


