# Write your MySQL query statement below

SELECT
    artist,
    COUNT(artist) AS occurrences
FROM
    Spotify
GROUP BY
    artist
ORDER BY
    COUNT(artist) DESC,
    artist
