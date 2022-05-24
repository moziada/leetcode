/* Write your T-SQL query statement below */

SELECT MAX(salary) AS SecondHighestSalary
    FROM Employee
    WHERE salary NOT IN (
        SELECT TOP(1) salary
            FROM Employee
            ORDER BY salary DESC
    )