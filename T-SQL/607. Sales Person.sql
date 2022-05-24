/* Write your T-SQL query statement below */

WITH REDOrders AS (
SELECT O.sales_id FROM Orders O LEFT JOIN Company C
ON O.com_id = C.com_id
WHERE C.name = 'RED')

SELECT name FROM SalesPerson S
WHERE S.sales_id NOT IN (SELECT sales_id FROM REDOrders)