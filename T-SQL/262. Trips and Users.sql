/* Write your T-SQL query statement below */

WITH ValidTrips AS (
SELECT T.request_at, T.status
FROM Trips T JOIN Users C ON T.client_id = C.users_id
            JOIN Users D ON T.driver_id = D.users_id
WHERE C.banned = 'No' AND D.banned = 'No')
SELECT request_at AS Day,
        ROUND(AVG(CASE WHEN status <> 'completed' THEN 1.0 ELSE 0.0 END),2) AS 'Cancellation Rate'
        FROM ValidTrips
        WHERE request_at BETWEEN '2013-10-01' and '2013-10-03'
        GROUP BY request_at 