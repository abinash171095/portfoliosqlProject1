DROP TABLE IF EXISTS #Temp_Employee2

CREATE TABLE #Temp_Employee2(
JobTitle varchar(50),
EmployeesPerJob int,
AvgAge int,
AvgSalary int
)
INSERT INTO #Temp_Employee2 
SELECT JobTitle, COUNT(JobTitle),Avg(AGE),AVG(salary)
FROM [Sql Tutorial].dbo.EmployeeDemographics emp
Join [Sql Tutorial].dbo.EmployeeSalary sal
ON emp.EmployeeID=sal.EmployeeID
group by JobTitle

SELECT *
FROM #Temp_Employee2