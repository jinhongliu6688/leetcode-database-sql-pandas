# Write your MySQL query statement below

SELECT
    s1.user_id,
    s3.steps_date,
    ROUND((s1.steps_count + s2.steps_count + s3.steps_count) / 3, 2) rolling_average
FROM
    Steps s1,
    Steps s2,
    Steps s3
WHERE
    s1.steps_date + 1 = s2.steps_date AND
    s2.steps_date + 1 = s3.steps_date AND
    s1.user_id = s2.user_id AND
    s2.user_id = s3.user_id
ORDER BY
    1,
    2;

# Write your MySQL query statement below

SELECT
    *
FROM (
    SELECT
        user_id,
        DATE_ADD(steps_date, INTERVAL 1 DAY) steps_date,
        ROUND(IF(
            DATEDIFF(steps_date, LAG(steps_date) OVER (PARTITION BY user_id ORDER BY steps_date)) = 1 AND
            DATEDIFF(LEAD(steps_date) OVER (PARTITION BY user_id ORDER BY steps_date), steps_date) = 1,
            (steps_count + LAG(steps_count) OVER (PARTITION BY user_id ORDER BY steps_date) + 
            LEAD(steps_count) OVER (PARTITION BY user_id ORDER BY steps_date)) / 3,
            -1
        ), 2) AS rolling_average
    FROM
        Steps
) temp
WHERE
    rolling_average <> -1
ORDER BY
    user_id,
    steps_date;

# Write your MySQL query statement below

SELECT
    *
FROM (
    SELECT
        user_id,
        steps_date,
        ROUND(IF(
            DATEDIFF(steps_date, LAG(steps_date) OVER (PARTITION BY user_id ORDER BY steps_date)) = 1 AND
            DATEDIFF(steps_date, LAG(steps_date, 2) OVER (PARTITION BY user_id ORDER BY steps_date)) = 2,
            (steps_count + LAG(steps_count) OVER (PARTITION BY user_id ORDER BY steps_date) + 
            LAG(steps_count, 2) OVER (PARTITION BY user_id ORDER BY steps_date)) / 3,
            -1
        ), 2) AS rolling_average
    FROM
        Steps
) temp
WHERE
    rolling_average <> -1
ORDER BY
    user_id,
    steps_date;

# Write your MySQL query statement below
# Sample solution 1

select user_id, steps_date, rolling_average
from (
    select user_id, steps_date,
    round(avg(steps_count) over (partition by user_id order by steps_date rows between 2 preceding and current row), 2) as rolling_average,
    lag(steps_date, 2) over (partition by user_id order by steps_date) as two_dates_before
    from steps
) tmp
where datediff(steps_date, two_dates_before) = 2
order by 1, 2;

# Write your MySQL query statement below
# Sample solution 2

with a as (
select user_id, steps_date, 
  avg(steps_count) over (
      partition by user_id
      order by steps_date 
      range between interval 2 day preceding and current row
  ) as rolling_average, 
  count(1) over (
      partition by user_id
      order by steps_date 
      range between interval 2 day preceding and current row        
  ) as cnt_3day
from steps
)
select user_id, steps_date, round(rolling_average, 2) as rolling_average
from a
where cnt_3day = 3;
