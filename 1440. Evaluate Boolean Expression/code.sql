# Write your MySQL query statement below

SELECT
    v1.name left_operand,
    operator,
    v2.name right_operand,
    CASE
        WHEN operator = "=" THEN IF(v1.value = v2.value, "true", "false")
        WHEN operator = ">" THEN IF(v1.value > v2.value, "true", "false")
        ELSE IF(v1.value < v2.value, "true", "false")
    END AS value
FROM
    Variables v1
INNER JOIN
    Expressions e
ON
    v1.name = e.left_operand
INNER JOIN
    Variables v2
ON
    v2.name = e.right_operand
