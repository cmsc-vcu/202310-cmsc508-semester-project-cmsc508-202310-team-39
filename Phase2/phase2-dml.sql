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
