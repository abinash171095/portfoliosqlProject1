/*SELECT JobTitle, AVG(Salary)
FROM [Sql Tutorial].dbo.EmployeeDemographics
JOIN [Sql Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
Having AVG(Salary)>45000
ORDER BY AVG(Salary)*/

SELECT*
FROM [Sql Tutorial].dbo.EmployeeDemographics

/*(UPDATE [Sql Tutorial].dbo.EmployeeDemographics
SET EmployeeID=1012
WHERE FirstName='Holly' LastName='Flax'*/

SELECT FirstName+''+LastName AS FullName
FROM [Sql Tutorial].dbo.EmployeeDemographics

SELECT Demo.EmployeeID
FROM [Sql Tutorial].dbo.EmployeeDemographics AS Demo
JOIN [Sql Tutorial].dbo.EmployeeSalary AS Sal
ON Demo.EmployeeID=Sal.EmployeeID