-- phase2-dml.sql

-- query 1: How many streamers average over 10,000 viewers?

SELECT
    name,
    avg_viewers
FROM Streamer a
    join Stream b on (name = streamer_name)
WHERE
    avg_viewers >= 10000
;

-- query 2: Display a list of each game genre and their total current viewers

SELECT
    game_name,
    game_genre,
    total_current_viewers
FROM
    Game
ORDER BY
    1
;

-- query 3: What were the top 3 most common languages spoken in each stream?

SELECT
    language,
    count(language) as lang_count
FROM
    Stream
GROUP BY
    language
ORDER BY
    lang_count DESC
LIMIT 3;

-- query 4: Display a list of each Streamer's age and their number of followers

SELECT
    name,
    age,
    follower_count
FROM
    Streamer
ORDER BY
    age DESC
;

-- query 5: What were the top 2 oldest games streamed?

SELECT
    game_name,
    game_release_date
FROM
    Game
ORDER BY
    game_release_date ASC
LIMIT 2
;
