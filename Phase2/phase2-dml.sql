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

-- query 6: Find the average number of characters in each streamers’ name


with counter_cte as (
    SELECT
        name,
        LENGTH(name) as lenNames
    FROM
        Streamer
    GROUP BY
        name
)
SELECT
    format(sum(lenNames) / count(name), 1) as avgChar
FROM counter_cte;

-- query 7: What is the average number of acharacters on average in streamers' stream titles? 
-- Find the offset between the average and each streamer's title.


SELECT
    streamer_name,
    title, 
    LENGTH(title) as title_length,
    format((SELECT AVG(LENGTH(title)) FROM Stream), 1) as avg_title_length,
    abs(format((LENGTH(title) - (SELECT AVG(LENGTH(title)) FROM Stream)), 1)) as offset
FROM Stream
order by offset asc;


