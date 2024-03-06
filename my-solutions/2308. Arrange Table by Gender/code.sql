# Write your MySQL query statement below

SELECT
    user_id,
    gender
FROM
    Genders
ORDER bY
    row_number() over(partition by gender order by user_id),
    length(gender) DESC
