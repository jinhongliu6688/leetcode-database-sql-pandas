# Write your MySQL query statement below

SELECT
    name
FROM
    SalesPerson
WHERE
    sales_id NOT IN (
        SELECT
            S.sales_id
        FROM
            SalesPerson S
        LEFT JOIN
            Orders O ON S.sales_id = O.sales_id
        LEFT JOIN
            Company C ON C.com_id = O.com_id
        WHERE
            C.name = "RED"
    )

# Write your MySQL query statement below

SELECT
    S.name
FROM
    SalesPerson S
LEFT JOIN
    Orders O ON S.sales_id = O.sales_id
LEFT JOIN
    Company C ON C.com_id = O.com_id
GROUP BY
    S.sales_id
HAVING
    SUM(IF(C.name = 'RED', 1, 0)) = 0
