/* Write your T-SQL query statement below */

WITH ctf AS (
    SELECT *, id - ROW_NUMBER() OVER(ORDER BY id) AS diff_pk
    FROM Stadium
    WHERE people >= 100
)

SELECT id, visit_date, people
FROM ctf
RIGHT JOIN (SELECT diff_pk FROM ctf GROUP BY diff_pk HAVING COUNT(*) >= 3) AS selectedRecordsTable
ON ctf.diff_pk = selectedRecordsTable.diff_pk