/* Partion by
SELECT FirstName, LastName, Gender,Salary,
COUNT (Gender) OVER(PARTITION BY Gender) AS TOTALGender
FROM [Sql Tutorial].dbo.EmployeeDemographics dem
JOIN [Sql Tutorial].dbo.EmployeeSalary sal
ON dem.EmployeeID=sal.EmployeeID;

/*SELECT  Gender,
COUNT (Gender) 
FROM [Sql Tutorial].dbo.EmployeeDemographics dem
JOIN [Sql Tutorial].dbo.EmployeeSalary sal
ON dem.EmployeeID=sal.EmployeeID
GROUP BY  Gender*/
/*CTEs*/
WITH CTE_Employee AS (
    SELECT 
        FirstName, 
        LastName, 
        Gender, 
        Salary,
        COUNT(Gender) OVER (PARTITION BY Gender) AS TOTALGender,
        AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
    FROM [Sql Tutorial].dbo.EmployeeDemographics dem
    JOIN [Sql Tutorial].dbo.EmployeeSalary sal
        ON dem.EmployeeID = sal.EmployeeID
    WHERE Salary > 45000
)
SELECT * 
FROM CTE_Employee;

TEMP tables*/
DROP TABLE IF EXISTS #temp_Employee;

CREATE TABLE #temp_Employee(
    EmployeeID INT,
    JobTitle VARCHAR(50),
    Salary INT
);

INSERT INTO #temp_Employee VALUES(1001, 'HR', 45000);


INSERT INTO #temp_Employee SELECT* 
FROM [Sql Tutorial].dbo.EmployeeSalary
SELECT * FROM #temp_Employee;


CREATE TABLE #temp_Employee2(