# Write your MySQL query statement below

select
    concat(group_concat(tag order by power desc SEPARATOR ""), "=0") equation
from (
    select
        case
            when power = 1 then if(factor > 0, concat("+", factor, "X"), concat(factor, "X"))
            when power = 0 then if(factor > 0, concat("+", factor), factor)
            else if(factor > 0, concat("+", factor, "X", "^", power), concat(factor, "X", "^", power))
        end as tag,
        power
    from
        Terms
) temp
