# Write your MySQL query statement below

with cte as (
    select
        *,
        datediff(period_end, period_start),
        case
            when LEFT(period_start, 4) = 2018 and LEFT(period_end, 4) > 2018 THEN datediff("2018-12-31", period_start) + 1
            when LEFT(period_start, 4) = 2018 and LEFT(period_end, 4) = 2018 THEN datediff(period_end, period_start) + 1
        end as "count2018",
        case
            when LEFT(period_start, 4) = 2019 and LEFT(period_end, 4) > 2019 THEN datediff("2019-12-31", period_start) + 1
            when LEFT(period_start, 4) = 2019 and LEFT(period_end, 4) = 2019 THEN datediff(period_end, period_start) + 1
            when LEFT(period_start, 4) < 2019 and LEFT(period_end, 4) > 2019 THEN datediff("2019-12-31", "2019-01-01") + 1
            when LEFT(period_start, 4) < 2019 and LEFT(period_end, 4) = 2019 THEN datediff(period_end, "2019-01-01") + 1
        end as "count2019",
        case
            when period_start < "2020-01-01" and period_end >= "2020-01-01" THEN datediff(period_end, "2020-01-01") + 1
        end as "count2020"
    from
        Sales
    inner join
        Product
    using
        (product_id)
)
select
    *
from (
    select
        product_id,
        product_name,
        "2018" as report_year,
        average_daily_sales * count2018 as total_amount
    from
        cte

    UNION

    select
        product_id,
        product_name,
        "2019" as report_year,
        average_daily_sales * count2019 as total_amount
    from
        cte

    UNION

    select
        product_id,
        product_name,
        "2020" as report_year,
        average_daily_sales * count2020 as total_amount
    from
        cte
) temp
where
    total_amount IS NOT null
order by
    product_id,
    report_year;
