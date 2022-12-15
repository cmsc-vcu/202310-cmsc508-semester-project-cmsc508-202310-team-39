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

-- query 7: What is the average number of characters on average in streamers' stream titles? 
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

-- query 12: Who gained the most subcribers and followers collectively in 1 stream?

SELECT
    streamer_name,
    followers_gained,
    subscribers_gained,
    (followers_gained+subscribers_gained) as total_gained
FROM
    stream
ORDER BY
    total_gained DESC;

-- query 13: There is a very big difference in the atmosphere of a chatroom that is just spamming the same 
-- messages verses a chatroom with actual unique thought. Which streamer had the most unique chatters per average view_count?

SELECT
    streamer_name
    avg_category_viewers,
    unique_messages,
    (unique_messages/avg_category_viewers) as unique_per_viewers
FROM
    stream a 
        join category b on (a.streamID = b.streamID)
        join chat c on (b.streamID = c.streamID)
ORDER BY
    unique_per_viewers DESC;

-- query 14: Create a list of the amount of money each Twitch streamer made from subscriptions. Make sure that partnered streamers
-- earn $3 for each subscription, and non-partnered streamers make $2.5.

SELECT
    name,
    subscriber_count,
    partner_status,
    concat('$', ( CASE WHEN partner_status=1 THEN 3*subscriber_count ELSE 0 END) ) as dollars_earned_partnered,
    concat('$', ( CASE WHEN partner_status=0 THEN 2.5*subscriber_count ELSE 0 END)) as dollars_earned_affiliate
FROM
    streamer
ORDER BY
    dollars_earned_partnered DESC
;

-- query 15: Find the number of games played across each stream; don't include Personal categories like Just Chatting.
-- Look at the different genre categories.

SELECT
    streamer_name,
    start_date,
    game_name,
    game_genre
FROM
    stream a 
        join category b on (a.streamID = b.streamID)
        join game c on (b.streamID = c.streamID)
WHERE
    category_name=game_name
;

-- query 16: Now rank each game according to the number of hours streamed
SELECT
    game_name,
    sum(duration_in_hours) as total_duration
FROM
    category a
        join game b on (a.streamID = b.streamID)
group by
    game_name
order by
    total_duration DESC
;

--query 17: Wow! How interesting! I wonder why Minecraft is the most streamed game?
-- Anyways, now I want you to figure out if total hours streamed for a game correlates with their game rank!

SELECT
    game_name,
    sum(duration_in_hours) as total_duration,
    game_popularity_rank
FROM
    category a
        join game b on (a.streamID = b.streamID)
GROUP BY
    game_name
ORDER BY
    game_popularity_rank
;

--query 18: Huh. I guess it kinda does. Create a query that adds the follower and subcriber count for each of the streams
-- to the respective streamer. Make this a new column.

SELECT
    name,
    follower_count,
    subscriber_count
    followers_gained,
    subscribers_gained,
    (follower_count + sum(followers_gained)) as new_follow_count,
    (subscriber_count + sum(subscribers_gained)) as new_subscriber_count
FROM
    streamer a
        join stream b on (a.name = b.streamer_name)
GROUP BY
    name, followers_gained, subscribers_gained
;

-- query 19: Now calculate the percent increase in follower/subscribers over these streams.

with data_cte as (
SELECT
    name,
    follower_count,
    subscriber_count,
    followers_gained,
    subscribers_gained,
    (follower_count + sum(followers_gained)) as new_follow_count,
    (subscriber_count + sum(subscribers_gained)) as new_subscriber_count
FROM
    streamer a
        join stream b on (a.name = b.streamer_name)
GROUP BY
    name, followers_gained, subscribers_gained
)
SELECT
    name,
    concat(format((100*new_follow_count/follower_count), 2), '%') as percent_followers_increased,
    concat(format((100*new_subscriber_count/subscriber_count), 2), '%') as percent_subscibers_increased
FROM
    data_cte
;

-- query 20: Finally, find the number of unique message per number of chatters for each stream

SELECT
    streamer_name,
    num_chatters,
    unique_messages,
    format((unique_messages/num_chatters),3) as upc
FROM
    stream a 
        join chat b on (a.streamID = b.streamID)
ORDER BY
    upc
;







    
    






