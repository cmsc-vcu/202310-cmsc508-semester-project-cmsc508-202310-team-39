-- phase2-dml.sql

-- query 1: How many streamers average over 10,000 viewers?

SELECT
    name,
    avg_viewers
FROM streamer a
    join stream b on (name = streamer_name)
WHERE
    avg_viewers >= 10000
;

-- query 2: Display a list of each game genre and their total current viewers

SELECT
    game_name,
    game_genre,
    total_current_viewers
FROM
    game
ORDER BY
    1
;

-- query 3: What were the top 3 most common languages spoken in each stream?

SELECT
    language,
    count(language) as lang_count
FROM
    stream
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
    streamer
ORDER BY
    age DESC
;

-- query 5: What were the top 2 oldest games streamed?

SELECT
    game_name,
    game_release_date
FROM
    game
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
        streamer
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
    format((SELECT AVG(LENGTH(title)) FROM stream), 1) as avg_title_length,
    abs(format((LENGTH(title) - (SELECT AVG(LENGTH(title)) FROM stream)), 1)) as offset
FROM stream
order by offset asc;

-- query 8: Which streamer has the most subscriptions per average viewcount?

SELECT
    name,
    subscriber_count,
    avg_viewers,
    format((subscriber_count / avg_viewers),2) as subs_per_viewcount
FROM
    streamer a
        join stream b on (name=streamer_name)
ORDER BY subs_per_viewcount DESC
LIMIT 1;

-- query 9: Which day was most commonly streamed?

with day_cte as(
    SELECT
        streamer_name,
        (SELECT(DAYNAME(start_date))) as dayname
    FROM
        stream
)
SELECT
    dayname,
    count(dayname)
FROM
    day_cte
GROUP by
    dayname
LIMIT 1;

-- query 10: Calculate the end_time for one of xQc's streams

SELECT
    streamer_name,
    category_name,
    start_date,
    start_time,
    (SELECT DATE_ADD(start_time, INTERVAL duration_in_hours HOUR)) as end_time,
    duration_in_hours
FROM
    stream a
        join category b on (a.streamID=b.streamID)
WHERE
    streamer_name='xQc'
    and start_date='2022-12-10 22:06:30'
;
-- query 11: Now calculate the duration of each of xQc's streams
SELECT
    streamer_name,
    start_date,
    SUM(duration_in_hours) as duration
FROM
    stream a 
        join category b on (a.streamID = b.streamID)
GROUP by
    streamer_name, start_date
;
    
    






