CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT MAX(salary) "SecondHighestSalary"
            FROM Employee
            WHERE salary NOT IN (
                SELECT TOP(@N - 1) S.salary
                FROM (
                SELECT DISTINCT(salary)
                    FROM Employee
             ) S
                    ORDER BY S.salary DESC
                )
         );
END