USE SoftUni;

SELECT TOP 5 e.EmployeeID, e.JobTitle, a.AddressID,a.AddressText
FROM Employees e
JOIN Addresses a ON e.AddressID=a.AddressID
ORDER BY a.AddressID;

SELECT TOP 5 e.EmployeeID, e.FirstName, e.Salary, d.Name AS DepartmentName
FROM Employees e
JOIN Departments d ON d.DepartmentID=e.DepartmentID
WHERE e.Salary>15000
ORDER BY d.DepartmentID;

SELECT TOP 3 e.EmployeeID, e.FirstName
FROM Employees e
WHERE e.EmployeeID NOT IN (SELECT ep.EmployeeID FROM EmployeesProjects ep)
ORDER BY e.EmployeeID;

SELECT TOP 3 e.EmployeeID, e.FirstName
FROM Employees e
LEFT JOIN EmployeesProjects ep
ON ep.EmployeeID =e.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID

SELECT TOP 5 e.EmployeeID, e.FirstName, p.Name AS [ProjectName]
FROM Employees e
JOIN EmployeesProjects ep ON e.EmployeeID=ep.EmployeeID
JOIN Projects p
ON p.ProjectID =ep.ProjectID
WHERE p.StartDate> '08-13-2002'
AND p.EndDate IS NULL
ORDER BY e.EmployeeID;

SELECT e.EmployeeID, e.FirstName,
CASE
WHEN p.StartDate >= '01-01-2005' THEN NULL 
ELSE p.Name
END AS [ProjectName]

FROM Employees e
JOIN EmployeesProjects ep ON e.EmployeeID=ep.EmployeeID
JOIN Projects p
ON p.ProjectID =ep.ProjectID
WHERE e.EmployeeID=24 ;

SELECT e.EmployeeID, e.FirstName,e.ManagerID,em.FirstName AS [ManagerName]
FROM Employees e
JOIN Employees em ON em.EmployeeID=e.ManagerID
WHERE e.ManagerID=3 OR e.ManagerID=7
ORDER BY e.EmployeeID;

USE Geography;

SELECT c.CountryCode,m.MountainRange,p.PeakName,p.Elevation
FROM Countries c
JOIN MountainsCountries mc ON c.CountryCode=mc.CountryCode
JOIN Mountains m ON m.Id=mc.MountainId
Join Peaks p ON p.MountainId=m.Id
Where c.CountryCode='BG' AND p.Elevation>2835
ORDER BY p.Elevation DESC;

SELECT c.CountryCode, COUNT(m.MountainRange)
FROM Countries c
JOIN MountainsCountries mc ON c.CountryCode=mc.CountryCode AND c.CountryCode IN('BG','RU','US')
JOIN Mountains m ON m.Id=mc.MountainId
GROUP BY c.CountryCode