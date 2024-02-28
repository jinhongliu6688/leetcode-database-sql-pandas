SELECT
    DISTINCT c1.user_id
FROM
    Confirmations c1,
    Confirmations c2
WHERE
    c1.user_id = c2.user_id AND
    c1.time_stamp < c2.time_stamp AND
    TIMESTAMPDIFF(SECOND, c1.time_stamp, c2.time_stamp) <= 86400
