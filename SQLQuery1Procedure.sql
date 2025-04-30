--Upper and lower cases
----Select FirstName, LOWER(FirstName)
--From EmployeeErrors

--Select FirstName, UPPER(FirstName)
--From EmployeeErrors
--Stored procedures
--Msg 111, Level 15, State 1, Line 11
--'CREATE/ALTER PROCEDURE' must be the first statement in a query batch.



--CREATE PROCEDURE TEST_Procedur

/*AS
Select *
From [Sql Tutorial].dbo.EmployeeDemographics
DROP PROCEDURE TEST_Procedur
EXEC TEST_Procedur*/


--Create Procedure Temp_Employe
--As
/*CREATE table ##temp_employe(
Jobtitle varchar(100),
EmployeesPerJob int ,
AvgAge int ,
AvgSalary int
)/*

Insert into ##temp_employe
SELECT Jobtitle, COUNT (Jobtitle), Avg(Age), AVG(salary)
From [Sql Tutorial].dbo.EmployeeDemographics emp
JOIN [Sql Tutorial].dbo.EmployeeSalary sal
ON emp.EmployeeID=sal.EmployeeID
group by JobTitle
  SELECT * FROM ##temp_employe*/
  --drop table ##temp_employe*/
/*
  CREATE PROCEDURE Temp_Employees
AS
SELECT Jobtitle, COUNT(Jobtitle) AS EmployeesPerJob, AVG(Age) AS AvgAge, AVG(Salary) AS AvgSalary
FROM [Sql Tutorial].dbo.EmployeeDemographics emp
JOIN [Sql Tutorial].dbo.EmployeeSalary sal
ON emp.EmployeeID = sal.EmployeeID
GROUP BY Jobtitle*/


--CREATE PROCEDURE TEST 
--AS 
--SELECT*
--From EmployeeDemographics

--EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
Create table #temp_employee(
Jobtitle varchar(150),
EmployeePerJob int ,
AvgAge int,
Avgsalary int
)

Insert into #temp_employee
Select JobTitle,COUNT(JobTitle),Avg(Age),AVG(salary)
From [Sql Tutorial].dbo.EmployeeDemographics emp
JOIN [Sql Tutorial].dbo.EmployeeSalary sal
ON emp.EmployeeID=sal.EmployeeID
group by JobTitle
Select *
From #temp_employee
EXEC Temp_Employee @JobTitle='Salesman'