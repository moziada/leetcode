/* Write your T-SQL query statement below */

WITH ShiftedTable AS (
SELECT id, DATEADD(day, 1, recordDate) AS shifted_date, recordDate, temperature
FROM Weather)

SELECT T1.id
FROM ShiftedTable T1 LEFT JOIN ShiftedTable T2
ON T1.recordDate = T2.shifted_date
WHERE T1.temperature - T2.temperature > 0