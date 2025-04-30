SELECT JobTitle,AVG(Salary)
FROM [Sql Tutorial].dbo.EmployeeDemographics
Full Outer Join [sql Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE JobTitle='Salesman'
GROUP BY JobTitle



