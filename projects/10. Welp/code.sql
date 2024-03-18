-- Welp

-- To practice what you’ve learned about joining multiple tables, you are going to use data from an exciting app called Welp. Users love Welp because it allows them to leave reviews of businesses in their city and see how other people reviewed the businesses.

-- For this project, you will be working with two tables:

-- places
-- reviews


-- 1
-- Let’s see what these tables contain by running the following commands:

SELECT * 
FROM places;
 
SELECT * 
FROM reviews;

-- 2
-- If each dollar sign ($) represents $10, how could you find all places that cost $20 or less?

SELECT
  *
FROM
  places
WHERE
  price_point = "$$" OR
  price_point = "$"

-- 3
-- What columns can be used to JOIN these two tables?

-- reviews.place_id

-- 4
-- Let’s explore how the places on Welp stand up to reviewers.
-- Write a query to do an INNER JOIN on the two tables to show all reviews for restaurants that have at least one review.

SELECT
  *
FROM
  places p
INNER JOIN
  reviews r
ON
  p.id = r.place_id;

-- 5
-- You probably noticed all the extra information in your results.
-- Modify your previous query to select only the most important columns in order to display a log of reviews by selecting the following:
-- From the places table: name, average_rating
-- From the reviews table: username, rating, review_date, note

SELECT
  p.name,
  p.average_rating,
  r.username,
  r.rating,
  r.review_date,
  r.note
FROM
  places p
INNER JOIN
  reviews r
ON
  p.id = r.place_id;

-- 6
-- Now write a query to do a LEFT JOIN on the tables, selecting the same columns as the previous question.
-- How are the results of this query different? Would this or the INNER JOIN be more useful for a log of reviews?

SELECT
  p.name,
  p.average_rating,
  r.username,
  r.rating,
  r.review_date,
  r.note
FROM
  places p
LEFT JOIN
  reviews r
ON
  p.id = r.place_id;

-- 7
-- What about the places without reviews in our dataset?
-- Write a query to find all the ids of places that currently do not have any reviews in our reviews table.

SELECT
  p.id
FROM
  places p
LEFT JOIN
  reviews r
ON
  p.id = r.place_id
WHERE
  r.place_id IS NULL;

-- 8
-- Sometimes on Welp, there are some old reviews that aren’t useful anymore.
-- Write a query using the WITH clause to select all the reviews that happened in 2020. JOIN the places to your WITH query to see a log of all reviews from 2020.
-- (This will use the WITH clause as well as the strftime() function. See if you can use Google to dig up some information about the function before take a look at the hint.)

WITH reviews_2020 AS (
  SELECT *
  FROM reviews 
  WHERE strftime("%Y", review_date) = 2020
)

SELECT
  *
FROM
  places p
INNER JOIN
  reviews r
ON
  p.id = r.place_id;
