/* Write your T-SQL query statement below */

WITH NumOFOrdersIn2019 AS (
SELECT buyer_id, COUNT(*) AS orders_in_2019
FROM Orders
WHERE YEAR(order_date) = 2019
GROUP BY buyer_id
)
SELECT U.user_id AS buyer_id, U.join_date, ISNULL(orders_in_2019, 0) AS orders_in_2019
FROM NumOFOrdersIn2019 RIGHT JOIN Users U
ON NumOFOrdersIn2019.buyer_id = U.user_id