-- 1
-- Create a table named friends with three columns:
-- id that stores INTEGER
-- name that stores TEXT
-- birthday that stores DATE

CREATE TABLE friends(
  id INTEGER,
  name TEXT,
  birthday DATE
);

-- 2
-- Beneath your current code, add Ororo Munroe to friends.
-- Her birthday is May 30th, 1940.

INSERT INTO friends (id, name, birthday)
VALUES (1, 'Ororo Munroe', '1940-05-30');

-- 3
-- Let’s make sure that Ororo has been added to the database:
-- Check for two things:
-- Is friends table created?
-- Is Ororo Munroe added to it?

SELECT 
  *
FROM 
  friends;

-- 4
-- Let’s move on!
-- Add two of your friends to the table.
-- Insert an id, name, and birthday for each of them.

INSERT INTO friends (id, name, birthday)
VALUES (2, 'first1 last1', '1940-01-01');

INSERT INTO friends (id, name, birthday)
VALUES (3, 'first2 last2', '1950-02-01');

SELECT 
  *
FROM 
  friends;

-- 5
-- Ororo Munroe just realized that she can control the weather and decided to change her name. Her new name is “Storm”.
-- Update her record in friends.

UPDATE 
  friends
SET
  name = "Storm"
WHERE
  id = 1;

SELECT 
  *
FROM 
  friends;

-- 6
-- Add a new column named email.

ALTER TABLE 
  friends
ADD COLUMN
  email TEXT;

-- 7
-- Update the email address for everyone in your table.
-- Storm’s email is storm@codecademy.com.

UPDATE 
  friends
SET
  email = "storm@codecademy.com"
WHERE
  id = 1;

UPDATE 
  friends
SET
  email = "first1@g.com"
WHERE
  id = 2;

UPDATE 
  friends
SET
  email = "first2@g.com"
WHERE
  id = 3;

SELECT
  *
FROM
  friends;

-- 8
-- Wait, Storm is fictional…
-- Remove her from friends.

DELETE FROM
  friends
WHERE
  id = 1;

-- 9
-- Great job! Let’s take a look at the result one last time:

SELECT
  *
FROM
  friends;
