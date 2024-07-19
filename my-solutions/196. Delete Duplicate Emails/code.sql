# Write your MySQL query statement below

WITH temp_table AS (
    SELECT
        p2.id
    FROM
        Person p1,
        Person p2
    WHERE
        p1.email = p2.email AND
        p1.id < p2.id
)

DELETE
FROM
    Person
WHERE
    id IN (
        SELECT 
            id 
        FROM 
            temp_table
    )

# Write your MySQL query statement below

delete
from
    Person
where
    id not in (
        select 
            *
        from (
            select
                min(id)
            from
                Person
            group by
                email
        ) temp
        
    )
