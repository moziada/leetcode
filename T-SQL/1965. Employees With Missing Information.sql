/* Write your T-SQL query statement below */

SELECT joinRes.employee_id
FROM ( SELECT ISNULL(E.employee_id, S.employee_id) AS employee_id, E.name, S.salary
      FROM Employees E
      FULL JOIN Salaries S
      ON E.employee_id = S.employee_id ) joinRes
WHERE joinRes.name IS NULL OR joinRes.salary IS NULL
ORDER BY joinRes.employee_id