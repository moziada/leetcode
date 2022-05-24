/* Write your T-SQL query statement below */

WITH Diff_table AS (
SELECT num,
    ROW_NUMBER() OVER(ORDER BY id) - ROW_NUMBER() OVER(PARTITION BY num ORDER BY id) AS diff
FROM Logs)
SELECT DISTINCT(num) AS ConsecutiveNums
FROM Diff_table
GROUP BY num, diff
HAVING COUNT(num) >= 3