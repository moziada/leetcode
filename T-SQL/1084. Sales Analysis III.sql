/* Write your T-SQL query statement below */

WITH JoinTable AS (
SELECT S.product_id, P.product_name, S.sale_date
FROM Sales S LEFT JOIN Product P
ON S.product_id = P.product_id
)
SELECT product_id, product_name
FROM JoinTable
WHERE sale_date BETWEEN '2019-01-01' AND '2019-03-31'
EXCEPT
SELECT product_id, product_name
FROM JoinTable
WHERE sale_date NOT BETWEEN '2019-01-01' AND '2019-03-31'