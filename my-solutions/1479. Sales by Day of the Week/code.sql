# Write your MySQL query statement below

select
    item_category CATEGORY,
    SUM(if(weekday(order_date) = 0, quantity, 0)) as 'MONDAY',
    SUM(if(weekday(order_date) = 1, quantity, 0)) as 'TUESDAY',
    SUM(if(weekday(order_date) = 2, quantity, 0)) as 'WEDNESDAY',
    SUM(if(weekday(order_date) = 3, quantity, 0)) as 'THURSDAY',
    SUM(if(weekday(order_date) = 4, quantity, 0)) as 'FRIDAY',
    SUM(if(weekday(order_date) = 5, quantity, 0)) as 'SATURDAY',
    SUM(if(weekday(order_date) = 6, quantity, 0)) as 'SUNDAY'
from
    Orders o
right join
    Items i
using
    (item_id)
group by
    item_category
order by
    1;
