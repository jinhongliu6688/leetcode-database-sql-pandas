# Write your MySQL query statement below

select
    min(America) America,
    min(Asia) Asia,
    min(Europe) Europe
from (
    select
        case
            when continent = "America" then name
        end as America,
        case
            when continent = "Asia" then name
        end as Asia,
        case
            when continent = "Europe" then name
        end as Europe,
        row_number() over(partition by continent order by name) tag
    from
        Student
) temp
group by
    tag
