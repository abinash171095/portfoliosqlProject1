/*SELECT EmployeeID,FirstName,Age
FROM [Sql Tutorial].dbo.EmployeeDemographics
UNION 
SELECT EmployeeID,JobTitle,Salary
FROM [Sql Tutorial].dbo.EmployeeSalary
 ORDER BY EmployeeID*/

 /*SELECT FirstName, LastName, Age,
 CASE
	WHEN Age>30 THEN 'Old'

	ELSE 'Young'
END
 FROM [Sql Tutorial].dbo.EmployeeDemographics
 WHERE Age is NOT NULL
 ORDER BY Age*/

/*SELECT FirstName,LastName,JobTitle,Salary,
CASE 
	WHEN JobTitle='Salesman' THEN Salary+(Salary*.10)
	WHEN JobTitle='Accountant' THEN Salary+(Salary*.05)
	WHEN JobTitle='HR' THEN Salary+(Salary*.000001)
	ELSE Salary+(Salary*.03)
	END AS SalaryAfterRaise
FROM [Sql Tutorial].dbo.EmployeeDemographics
JOIN [Sql Tutorial].dbo.EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID*/


