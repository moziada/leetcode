/* Write your T-SQL query statement below */

SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1