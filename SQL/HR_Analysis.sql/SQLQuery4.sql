USE HR_Analytics;
GO

SELECT COUNT(*) AS TotalEmployees
FROM Employees;

SELECT TOP 10 *
FROM Employees;

SELECT DISTINCT Department
FROM Employees;

SELECT EmployeeNumber, COUNT(*) AS Total
FROM Employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

--Check missing values in important columns
SELECT
    COUNT(*) AS TotalRecords,
    COUNT(Age) AS AgeAvailable,
    COUNT(MonthlyIncome) AS IncomeAvailable,
    COUNT(Department) AS DepartmentAvailable,
    COUNT(Attrition) AS AttritionAvailable
FROM Employees;

--Count employees who left and stayed
SELECT
    Attrition,
    COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Attrition;

--Calculate overall attrition rate
SELECT
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS EmployeesLeft,
    CAST(
        100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*) AS DECIMAL(10,2)
    ) AS AttritionRate
FROM Employees;

--Department-wise attrition
SELECT
    Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
        AS EmployeesLeft
FROM Employees
GROUP BY Department
ORDER BY EmployeesLeft DESC;


USE HR_Analytics;
GO

-- Q1: should return 1470
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- Q3: should return 3 departments
SELECT DISTINCT Department FROM Employees;

-- Q4: should return no rows (no duplicate IDs)
SELECT EmployeeNumber, COUNT(*) AS Total
FROM Employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Q5: all counts should be 1470 (no NULLs in this dataset)
SELECT
    COUNT(*) AS TotalRecords,
    COUNT(Age) AS AgeAvailable,
    COUNT(MonthlyIncome) AS IncomeAvailable,
    COUNT(Department) AS DepartmentAvailable,
    COUNT(Attrition) AS AttritionAvailable
FROM Employees;

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees'
ORDER BY ORDINAL_POSITION;

SELECT
    COUNT(*) AS TotalRecords,
    COUNT(Age) AS AgeAvailable,
    COUNT([Monthly Income]) AS IncomeAvailable,
    COUNT([Department]) AS DepartmentAvailable,
    COUNT([Attrition]) AS AttritionAvailable
FROM Employees;

SELECT TABLE_SCHEMA, COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees'
ORDER BY ORDINAL_POSITION;

-- Q6: Stayed vs left
SELECT Attrition, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Attrition;

-- Q7: Overall attrition rate
SELECT
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM Employees;

-- Q8: Department-wise attrition (count + rate)
SELECT Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM Employees
GROUP BY Department
ORDER BY AttritionPct DESC;

-- Q9: Overtime vs attrition
SELECT OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM Employees
GROUP BY OverTime;

-- Q10: Job satisfaction vs attrition
SELECT JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM Employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT STRING_AGG(COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY ORDINAL_POSITION) AS AllColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Employees';
--

USE HR_Analytics;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';


USE HR_Analytics;
GO

SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

SELECT COUNT(*) AS TotalRows FROM dbo.HR_Employees;

SELECT STRING_AGG(COLUMN_NAME, ', ') WITHIN GROUP (ORDER BY ORDINAL_POSITION) AS AllColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'HR_Employees';




SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'HR_Employees'
ORDER BY ORDINAL_POSITION;




-- Q6: Stayed vs left
SELECT Attrition, COUNT(*) AS EmployeeCount
FROM HR_Employees
GROUP BY Attrition;

-- Q7: Overall attrition rate
SELECT
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Employees;

-- Q8: Department-wise attrition
SELECT Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM HR_Employees
GROUP BY Department
ORDER BY AttritionPct DESC;

-- Q9: Overtime vs attrition
SELECT OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM HR_Employees
GROUP BY OverTime;

-- Q10: Job satisfaction vs attrition
SELECT JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM HR_Employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'HR_Employees'
  AND COLUMN_NAME IN ('Attrition', 'OverTime', 'MonthlyIncome', 'JobSatisfaction');

  -- Q7: Overall attrition rate
SELECT
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionRate
FROM HR_Employees;

-- Q8: Department-wise attrition
SELECT Department,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM HR_Employees
GROUP BY Department
ORDER BY AttritionPct DESC;

-- Q9: Overtime vs attrition
SELECT OverTime,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM HR_Employees
GROUP BY OverTime;

-- Q10: Job satisfaction vs attrition
SELECT JobSatisfaction,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM HR_Employees
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT Attrition,
    COUNT(*) AS Employees,
    AVG(MonthlyIncome) AS AvgMonthlyIncome
FROM HR_Employees
GROUP BY Attrition;

SELECT AgeGroup,
    COUNT(*) AS TotalEmployees,
    SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END) AS EmployeesLeft,
    CAST(100.0 * SUM(CASE WHEN Attrition = 1 THEN 1 ELSE 0 END)
         / COUNT(*) AS DECIMAL(5,2)) AS AttritionPct
FROM (
    SELECT Attrition,
        CASE
            WHEN Age < 25 THEN 'Below 25'
            WHEN Age BETWEEN 25 AND 35 THEN '25-35'
            WHEN Age BETWEEN 36 AND 45 THEN '36-45'
            ELSE 'Above 45'
        END AS AgeGroup
    FROM HR_Employees
) t
GROUP BY AgeGroup
ORDER BY AttritionPct DESC;


USE HR_Analytics;
GO
