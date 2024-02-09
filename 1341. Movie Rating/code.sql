# Write your MySQL query statement below

(SELECT
    name AS results
FROM
    MovieRating
LEFT JOIN
    Movies
ON
    MovieRating.movie_id = Movies.movie_id
LEFT JOIN
    Users
ON
    MovieRating.user_id = Users.user_id
GROUP BY
    MovieRating.user_id
ORDER BY
    COUNT(*) DESC,
    name
LIMIT
    1)

UNION ALL

(SELECT
    title AS results
FROM
    MovieRating
LEFT JOIN
    Movies
ON
    MovieRating.movie_id = Movies.movie_id
LEFT JOIN
    Users
ON
    MovieRating.user_id = Users.user_id
WHERE
    created_at LIKE "2020-02%"
GROUP BY
    MovieRating.movie_id
ORDER BY
    AVG(rating) DESC,
    title
LIMIT
    1)
