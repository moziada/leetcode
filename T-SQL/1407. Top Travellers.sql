/* Write your T-SQL query statement below */

SELECT U.name, ISNULL(SUM(R.distance), 0) AS travelled_distance
FROM Rides R FULL JOIN Users U
ON R.user_id = U.id
GROUP BY U.name
ORDER BY travelled_distance DESC, U.name