/* Write your T-SQL query statement below */

SELECT D.name AS Department,
        E.name AS Employee,
        E.salary AS Salary
FROM
    (SELECT id, departmentId, DENSE_RANK() OVER(
    PARTITION BY departmentId
    ORDER BY salary DESC) AS EmpNum
    FROM Employee) DepsMaxSals
    JOIN Department D On DepsMaxSals.departmentId = D.id
    JOIN Employee E ON DepsMaxSals.id = E.id
    WHERE EmpNum <= 3