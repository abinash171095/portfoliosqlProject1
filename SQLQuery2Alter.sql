USE [Sql Tutorial]
GO

SET ANSI_NULLS ON 
GO
 SET QUOTED_IDENTIFIER ON 
 GO
 

 ALTER PROCEDURE [dbo].[Temp_Employee]
 @JobTitle nvarchar(100)
 AS
 Create table #temp_employee(
 JobTitle varchar (100),
 EmployeesPerJob int,
 AvgAge int,
 AvgSalary int
 )
 Insert into #temp_employee
 Select JobTitle, COUNT (JobTitle),Avg(Age),AVG(salary)
 From [Sql Tutorial].dbo.EmployeeDemographics emp
 JOIN [Sql Tutorial].dbo.EmployeeSalary sal
 ON emp.EmployeeID=sal.EmployeeID
 Where JobTitle=@JobTitle
 Group by JobTitle

 Select *
 From #temp_employee
