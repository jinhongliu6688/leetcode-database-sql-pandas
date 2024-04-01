# Write your MySQL query statement below

select
    product_id,
    quantity,
    price * quantity as price
from
    Products pr
inner join
    Purchases pu
using
    (product_id)
where
    invoice_id = (
        select
            invoice_id
        from (
            select
                invoice_id,
                SUM(price * quantity) price
            from
                Products pr
            inner join
                Purchases pu
            using
                (product_id)
            group by
                invoice_id
            order by
                2 desc,
                1
            limit
                1
        ) temp
    )

# Write your MySQL query statement below

select
    product_id,
    quantity,
    price * quantity as price
from
    Products pr
inner join
    Purchases pu
using
    (product_id)
where
    invoice_id = (
        select
            invoice_id
        from (
            select
                invoice_id,
                sum(price * quantity) price,
                rank() over(order by sum(price * quantity) desc, invoice_id) as ranking
            from
                Products pr
            inner join
                Purchases pu
            using
                (product_id)
            group by
                invoice_id
        ) temp
        where
            ranking = 1
    )
