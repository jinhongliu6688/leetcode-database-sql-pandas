# Write your MySQL query statement below

SELECT
    CONCAT(a1.topping_name, ",", a2.topping_name, ",", a3.topping_name) pizza,
    a1.cost + a2.cost + a3.cost total_cost
FROM
    Toppings a1,
    Toppings a2,
    Toppings a3
WHERE
    a1.topping_name < a2.topping_name AND
    a2.topping_name < a3.topping_name
ORDER BY
    2 DESC,
    1;
