/* Write your T-SQL query statement below */

SELECT name, SUM(amount) AS balance
FROM USERS U FULL JOIN Transactions T
ON U.account = T.account
GROUP BY name
HAVING SUM(amount) > 10000