/* Write your T-SQL query statement below */

SELECT D.name AS Department, E.name AS Employee, E.salary AS Salary
FROM (
    SELECT departmentId, MAX(Salary) AS maxSalary
    FROM Employee
    GROUP BY departmentId
    ) MaxSals
    JOIN Employee E ON E.departmentId = MaxSals.departmentId AND E.salary = MaxSals.maxSalary
    JOIN Department D ON D.id = E.departmentId