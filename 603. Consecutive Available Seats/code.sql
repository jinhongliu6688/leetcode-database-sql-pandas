# Write your MySQL query statement below

SELECT
    DISTINCT C1.seat_id
FROM
    Cinema C1,
    Cinema C2
WHERE
    C1.free = 1 AND C2.free = 1 AND 
    (C1.seat_id + 1 = C2.seat_id OR C1.seat_id - 1 = C2.seat_id)
ORDER BY
    C1.seat_id ASC
