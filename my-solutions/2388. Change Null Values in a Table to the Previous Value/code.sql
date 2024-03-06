# Write your MySQL query statement below

WITH new_CoffeeShop AS (
    SELECT
        *,
        row_number() over() rn
    FROM
        CoffeeShop
),
temp AS (
    SELECT
        n1.id,
        n1.drink,
        MAX(n2.rn) rn
    FROM
        new_CoffeeShop n1
    LEFT JOIn
        new_CoffeeShop n2
    ON
        n1.drink IS NULL AND
        n2.drink IS NOT NULL AND
        n1.rn > n2.rn
    GROUP BY
        n1.id
)
SELECT
    t.id,
    coalesce(t.drink, n.drink) drink
FROM
    temp t
LEFT JOIN
    new_CoffeeShop n
ON
    t.rn = n.rn

# Write your MySQL query statement below

SELECT
    id,
    IF(drink IS NOT NULL, @temp:= drink, @temp) drink
FROM
    CoffeeShop,
    (SELECT @temp:="") start

# Write your MySQL query statement below

SELECT
    id,
    @temp:=IF(drink IS NOT NULL, drink, @temp) drink
FROM
    CoffeeShop
