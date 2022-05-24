/* Write your T-SQL query statement below */

WITH cte AS (
SELECT COUNT(id) AS cnt
FROM Seat)

SELECT CASE
        WHEN id % 2 = 0 THEN id - 1
        WHEN id % 2 = 1 AND id <> cte.cnt THEN id + 1
        ELSE id END AS id, student
    
FROM Seat, cte
ORDER BY id