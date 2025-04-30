--Subquries

Select *
from EmployeeSalary

Select EmployeeID,Salary,(Select AVG(Salary) From EmployeeSalary) AS AllAvgSalary
From EmployeeSalary

Select EmployeeID,Salary, AVG(Salary) over() AS AllAvgSalary
From EmployeeSalary
--group by does'nt work
Select EmployeeID,Salary, AVG(Salary)  AS AllAvgSalary
From EmployeeSalary
Group by EmployeeID,Salary
Order by 1,2


Select a.EmployeeID, AllAvgSalary
From(Select EmployeeID,Salary, AVG(Salary) over() AS AllAvgSalary
		From EmployeeSalary) a

	Select EmployeeID,Salary, JobTitle
From EmployeeSalary
Where EmployeeID in (
			Select EmployeeID
			From EmployeeDemographics
			Where Age>30)
			SELECT EmployeeID, Salary, JobTitle
/*FROM EmployeeSalary sal
WHERE EXISTS (
    SELECT 1
    FROM EmployeeDemographics emp
    WHERE emp.EmployeeID = sal.EmployeeID
)*/