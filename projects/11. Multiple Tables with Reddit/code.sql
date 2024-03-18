-- Multiple Tables with Reddit

-- For this project, you’ll be working as a Data Analyst who will be examining some fictional data from Reddit, a social news aggregation, content rating site.

-- On Reddit, users can create posts with content such as text, media, and links to other websites. Users can post content to different communities known as subreddits, which focus on a particular topic. Users can then rate others’ content by upvoting or downvoting them, and each post will show its total cumulative score.

-- For this task you were given three tables:

-- users: users data
-- posts: posts information
-- subreddits: information about subreddits

-- 1
-- Let’s start by examining the three tables.
-- Write queries to select the rows from each table. Because some of the tables have many rows, select just the first 10 rows from each.

SELECT
  *
FROM
  posts
LIMIT
  10;

SELECT
  *
FROM
  subreddits
LIMIT
  10;

SELECT
  *
FROM
  posts2
LIMIT
  10;

SELECT
  *
FROM
  users
LIMIT
  10;

-- 2
-- What is the primary key for each table? Can you identify any foreign keys?

primary key:
posts.id
subreddits.id
posts2.id
users.id

foreign keys:
posts.user_id
posts.subreddit_id
posts2.user_id
posts2.subreddit_id

-- 3
-- Write a query to count how many different subreddits there are.

SELECT
  COUNT(id)
FROM
  subreddits;

-- 4
-- Write a few more queries to figure out the following information:
-- What user has the highest score?
-- What post has the highest score?
-- What are the top 5 subreddits with the highest subscriber_count?

SELECT 
  username, 
  MAX(score) AS 'highest_score'
FROM 
  users;

SELECT
  id,
  title,
  MAX(score) 'highest_score'
FROM
  posts;

SELECT
  u.username,
  COUNT(*) AS 'posts_made'
FROM
  users u
LEFT JOIN
  posts p
ON
  p.user_id = u.id
GROUP BY
  u.id
ORDER BY
  2;

-- 6
-- Over time, posts may be removed and users might delete their accounts.
-- We only want to see existing posts where the users are still active, so use an INNER JOIN to write a query to get these posts. Have the posts table as the left table.

SELECT 
  *
FROM
  posts
INNER JOIN 
  users
ON 
  posts.user_id = users.id;

-- 7
-- Some new posts have been added to Reddit!
-- Stack the new posts2 table under the existing posts table to see them.

SELECT
  *
FROM
  posts

UNION ALL

SELECT
  *
FROM
  posts2;

-- 8
-- Now you need to find out which subreddits have the most popular posts. We’ll say that a post is popular if it has a score of at least 5000. We’ll do this using a WITH and a JOIN.
-- First, you’ll need to create the temporary table that we’ll nest in the WITH clause by writing a query to select all the posts that have a score of at least 5000.
-- Next, place the previous query within a WITH clause, and alias this table as popular_posts.
-- Finally, utilize an INNER JOIN to join this table with the subreddits table, with subreddits as the left table. Select the subreddit name, the title and score of each post, and order the results by each popular post’s score in descending order.

WITH popular_posts AS (
  SELECT 
    *
  FROM 
    posts
  WHERE 
    score >= 5000
)
SELECT 
  subreddits.name, 
  popular_posts.title, 
  popular_posts.score
FROM 
  subreddits
INNER JOIN 
  popular_posts
ON 
  subreddits.id = popular_posts.subreddit_id
ORDER BY 
  popular_posts.score DESC;

-- 9
-- Next, you need to find out the highest scoring post for each subreddit.
-- Do this by using an INNER JOIN, with posts as the left table.

SELECT 
  posts.title, 
  subreddits.name AS 'subreddit_name', 
  MAX(score) AS 'highest_score'
FROM 
  posts
INNER JOIN 
  subreddits
ON 
  posts.subreddit_id = subreddits.id
GROUP BY 
  subreddits.id;

-- 10
-- Finally, you need to write a query to calculate the average score of all the posts for each subreddit.
-- Consider utilizing a JOIN, AVG, and GROUP BY to accomplish this, with the subreddits table as the left table.

SELECT 
  subreddits.name, 
  AVG(posts.score) AS 'average_score'
FROM 
  subreddits
INNER JOIN 
  posts
ON 
  subreddits.id = posts.subreddit_id
GROUP BY 
  subreddits.name
ORDER BY 
  2 DESC;
