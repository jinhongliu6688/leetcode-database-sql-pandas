-- The Metropolitan Museum of Art

-- The Metropolitan Museum of Art of New York is one of the world’s largest and finest art museums.

-- In this project, you will be working with a table named met that contains the museum’s collection of American Decorative Arts.

-- It has the following columns:

-- id - the id of the art piece
-- department - the department of the art piece
-- category - the category of the art piece
-- title - the title name of the art piece
-- artist - the name of the artist
-- date - the date(s) of the art piece
-- medium - the medium of the art piece
-- country - the country of the artist
-- This data was kindly made publicly available under the Open Access Policy.


-- 1
--  Start by getting a feel for the met table:

SELECT
  *
FROM
  met
LIMIT
  10;

-- 2
-- How many pieces are in the American Decorative Art collection?

SELECT
  COUNT(*)
FROM
  met;

-- 3
-- Celery was considered a luxurious snack in the Victorian era (around the 1800s). Wealthy families served stalks of it in intricate glass vases.
-- Don’t believe it?
-- Count the number of pieces where the category includes ‘celery’.

SELECT
  COUNT(*)
FROM
  met
WHERE
  category like '%celery%';

-- 4
-- Find the title and medium of the oldest piece(s) in the collection.

SELECT
  title,
  medium
FROM
  met
ORDER BY
  date
LIMIT
  1;

-- 5
-- Not every American decoration is from the Americas… where are they are coming from?
-- Find the top 10 countries with the most pieces in the collection.

SELECT
  country,
  COUNT(*)
FROM
  met
GROUP BY
  country
ORDER BY
  COUNT(*) DESC
LIMIT
  10;

-- 6
-- There are all kinds of American decorative art in the Met’s collection.
-- Find the categories HAVING more than 100 pieces.

SELECT
  category,
  COUNT(*)
FROM
  met
GROUP BY
  category
HAVING
  COUNT(*) > 100;

-- 7
-- Lastly, let’s look at some bling!
-- Count the number of pieces where the medium contains ‘gold’ or ‘silver’.
-- And sort in descending order.

SELECT
  CASE
    WHEN medium LIKE '%gold%' THEN 'Gold'
    WHEN medium LIKE '%silver%' THEN 'Silver'
  END AS 'Bling',
  COUNT(*)
FROM
  met
WHERE
  Bling IS NOT NULL
GROUP BY
  1
ORDER BY
  2 DESC;







