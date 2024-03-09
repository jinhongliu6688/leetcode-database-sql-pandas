# Write your MySQL query statement below

WITH banned_id AS (
    SELECT
        id
    FROM
        Trips t
    INNER JOIN
        Users u
    ON
        t.client_id = u.users_id OR
        t.driver_id = u.users_id
    WHERE
        banned = "Yes" AND
        request_at BETWEEN "2013-10-01" AND "2013-10-03"
)

SELECT
    request_at Day,
    ROUND(AVG(status LIKE "cancelled%"), 2) "Cancellation Rate"
FROM
    Trips t
INNER JOIN
    Users u
ON
    t.client_id = u.users_id OR
    t.driver_id = u.users_id
WHERE
    id NOT IN (SELECT id FROM banned_id) AND
    request_at BETWEEN "2013-10-01" AND "2013-10-03"
GROUP BY
    request_at;

# Write your MySQL query statement below

SELECT
    request_at Day,
    ROUND(AVG(status LIKE "cancelled%"), 2) "Cancellation Rate"
FROM (
    SELECT
        *,
        IF(AVG(banned = "No") = 1, 1, 0) "tag"
    FROM
        Trips t
    INNER JOIN
        Users u
    ON
        t.client_id = u.users_id OR
        t.driver_id = u.users_id
    WHERE
        request_at BETWEEN "2013-10-01" AND "2013-10-03"
    GROUP BY
        id
) temp
WHERE
    tag = 1
GROUP BY
    request_at
