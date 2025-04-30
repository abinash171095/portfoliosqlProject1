SELECT *
FROM [Sql Tutorial].dbo.EmployeeDemographics
UPDATE [Sql Tutorial].dbo.EmployeeDemographics
SET EmployeeID=1001, FirstName='Jim',
LastName='Halpert'
WHERE Age=30 AND Gender='Male'

DELETE [Sql Tutorial].dbo.EmployeeDemographics
WHERE EmployeeID=1012