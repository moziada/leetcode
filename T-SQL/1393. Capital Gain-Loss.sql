/* Write your T-SQL query statement below */

WITH BuySell AS (
SELECT stock_name, operation, CASE
    WHEN operation = 'Sell' THEN price
    ELSE -price
    END AS cost
FROM Stocks)

SELECT stock_name, SUM(cost) AS capital_gain_loss
FROM BuySell
GROUP BY stock_name