Drop Table if EXISTS EmployeeErrors
CREATE TABLE EmployeeErrors(
EmployeeID varchar(50),
FirstName varchar(50),
LastName varchar(50)
)


Insert into EmployeeErrors Values
('1001','Jimbo','Halbert'),
('1002','Pamela','Beasly'),
('1003','Toby','Flenderson-Fired')
Select*
From EmployeeErrors
select EmployeeID, Trim(EmployeeID) as trimmedEmployeeID
from EmployeeErrors

select EmployeeID, LTrim(EmployeeID) as trimmedEmployeeID
from EmployeeErrors

select EmployeeID, RTrim(EmployeeID) as trimmedEmployeeID
from EmployeeErrors
select LastName, Replace(lastName,'-Fired','') as LastNameChanged
from EmployeeErrors
select err.FirstName,SUBSTRING(err.FirstName,1,3),dem.FirstName,SUBSTRING(dem.FirstName,1,3)
from EmployeeErrors err
JOIN [Sql Tutorial].dbo.EmployeeDemographics dem
ON SUBSTRING(err.FirstName,1,3)= SUBSTRING(dem.FirstName,1,3)