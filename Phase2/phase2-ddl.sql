-- phase2-ddl.sql


-- drop table list

drop table if exists chat;
drop table if exists game;
drop table if exists category;
drop table if exists stream;
drop table if exists streamer;


-- task 1: create tables

create table streamer(
    name varchar(255) unique,
    age int not null,
    follower_count int NOT NULL,
    subscriber_count int NOT NULL,
    account_creation_date Date not null,
    partner_status boolean,
    primary key(name)
);
create table stream(
    streamID int not null AUTO_INCREMENT, 
    streamer_name varchar (255),
    start_date datetime not null,
    title varchar(255),
    avg_viewers float NOT NULL, 
    peak_viewers int NOT NULL, 
    followers_gained int NOT NULL,
    subscribers_gained int NOT NULL,
    language varchar(255),
    primary key (streamID),
    foreign key (streamer_name) references streamer(name)
);
create table category(
    category_name varchar(255),
    position int not null,
    avg_category_viewers float not null,
    peak_category_viewers int not null,
    start_time time not null,
    duration_in_hours int not null,
    streamID int not null,
    primary key (streamID, start_time),
    foreign key (streamID) references stream(streamID)
);

-- meant to be a disjoint set of category, but couldn't figure out how to actaully connect them by non unique or primary key
create table game(
    game_name varchar(255) unique,
    game_genre varchar(255),
    total_current_viewers int not null,
    game_popularity_rank int not null unique,
    game_release_date Date not null,
    game_category_type varchar(255),
    streamID int not null,
    primary key(game_name),
    foreign key (streamID) references stream(streamID),
    check (game_name != 'Just Chatting' and game_name != 'IRL')
);
create table chat(
    chat_ID int not null AUTO_INCREMENT, 
    num_chatters int not null,
    unique_messages int not null,
    streamID int not null, 
    primary key (chat_ID),
    foreign key (streamID) references stream(streamID)
);


-- task 2: insert values
insert into streamer(name, age, follower_count, subscriber_count, account_creation_date, partner_status) values
    ('xQc', 27, 11263559, 81193, '2014-9-12', TRUE),
    ('pokimane', 26, 9200000, 4000, '2013-6-7', TRUE),
    ('hasanabi', 32, 8000000, 50000, '2018-3-23', TRUE),
    ('erobb221', 27, 1000000, 3000, '2016-8-12', TRUE),
    ('clintstevens', 24, 2000000, 1500, '2015-7-6', TRUE)
;
insert into stream(streamer_name, start_date, title, avg_viewers, peak_viewers, followers_gained, subscribers_gained, language) values
    ('xQc', '2022-12-10 22:06:30', 'WELCOME TO THE GODDAMN STREAM BROTHER! 18 HOUR STREAM INCOMING!', 70000, 100000, 5000, 400, 'French'),
    ('xQc', '2022-12-11 20:04:01', 'yo', 70000, 100000, 5000, 400, 'French'),
    ('pokimane', '2022-12-10 12:00:05', 'Valorant!', 20000, 23000, 4000, 500, 'English'),
    ('hasanabi', '2022-12-10 11:08:10', 'Politics and shit', 30000, 50000, 3000, 500, 'Turkish'),
    ('erobb221', '2022-12-10 17:24:12', 'not ending stream until i land on mars', 6000, 7000, 1000, 100, 'French'),
    ('clintstevens', '2022-12-10 18:00:00', 'Welcome to the stream!', 4000, 6000, 1000, 200, 'English'),
    ('clintstevens', '2022-12-14 18:00:00', 'Polybridge', 4000, 6000, 1000, 200, 'English')
;
insert into category (streamID, category_name, position, avg_category_viewers, peak_category_viewers, start_time, duration_in_hours) values
    (1, 'Just Chatting', 2, 70000, 100000, '22:06:30', 1),
    (1, 'Minecraft', 1, 75000, 78000, '23:06:30', 5),
    (2, 'Just Chatting', 2, 80000, 95000, '20:04:01', 8),
    (3, 'Valorant', 1, 200000, 400000, '16:00:00', 5),
    (4, 'Hearthstone', 1, 200000, 400000, '16:00:00', 5),
    (5, 'Super Mario 64', 1, 200000, 400000, '16:00:00', 5),
    (6, 'Polybridge', 4, 5000, 10000, '18:00:00', 4)
;
insert into game(game_name, game_genre, total_current_viewers, game_popularity_rank, game_release_date, streamID) values 
    ('Minecraft', 'Sandbox', 100000, 5, '2011-11-18', 1),
    ('Valorant', 'Shooter', 100000, 4, '2013-9-17', 3),
    ('Hearthstone', 'TCG', 100000, 2, '2014-11-3', 4),
    ('Super Mario 64', 'Platformer', 100000, 3, '2015-11-10', 5),
    ('Polybridge', 'Puzzle', 100000, 1, '2015-6-30', 6)
;
insert into chat(streamID, num_chatters, unique_messages) values 
    (1, 70000, 200000),
    (2, 20000, 30000),
    (3, 30000, 40000),
    (4, 5000, 10000),
    (5, 6000, 8000)
;

-- task 3: drop list for views
drop view if exists streamer_view;
drop view if exists stream_view;
drop view if exists category_view;
drop view if exists chat_view;

-- task 4: create views

create view streamer_view as (
    SELECT
        name,
        age, 
        account_creation_date
    FROM
        streamer
    ORDER BY
        name
);
create view stream_view as (
    SELECT
        streamer_name,
        start_date,
        title
    FROM
        stream
    ORDER BY
        start_date
);
create view category_view as (
    SELECT
        streamer_name,
        category_name,
        start_date,
        start_time
    FROM
        stream a
            join category b on (a.streamID = b.streamID)
);
create view chat_view as (
    SELECT
        num_chatters,
        unique_messages
    FROM 
        chat
);

-- task 5: drop if exists procedures

drop procedure if exists GetStreamerInfo;
drop procedure if exists GetStreamInfo;
drop procedure if exists GetCategoryInfo;
drop procedure if exists GetGameInfo;
drop procedure if exists GetChatInfo;


-- task 6: create procedures

CREATE PROCEDURE `GetStreamerInfo`(IN `sname` VARCHAR(255)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER SELECT * FROM streamer WHERE name=sname;
CREATE PROCEDURE `GetStreamInfo`(IN `sname` VARCHAR(255)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER SELECT * FROM stream WHERE streamer_name=sname;
CREATE PROCEDURE `GetCategoryInfo`(IN `cname` VARCHAR(255)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER SELECT * FROM category WHERE category_name=cname;
CREATE PROCEDURE `GetGameInfo`(IN `gname` VARCHAR(255)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER SELECT * FROM game WHERE game_name=gname;
CREATE PROCEDURE `GetChatInfo`(IN `chid` VARCHAR(255)) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER SELECT * FROM stream WHERE chat_ID=chid;


-- task 7: drop triggers if exist

drop trigger if exists log_stream_changes_insert;
drop trigger if exists log_stream_changes_update;
drop trigger if exists log_stream_changes_delete;
drop trigger if exists update_follower_count;
drop trigger if exists update_subscriber_count;




-- task 8: create triggers


--sets up the creation of log tables

drop table if exists stream_changes_log
-- stream_changes_log table
CREATE TABLE stream_changes_log (
    id int,
    change_type varchar(255),
    streamer_name varchar(255),
    start_date datetime,
    title varchar(255),
    avg_viewers float,
    peak_viewers int,
    followers_gained int,
    subscribers_gained int,
    language varchar(255)
);


CREATE TRIGGER log_stream_changes_insert
AFTER INSERT ON stream
FOR EACH ROW
BEGIN
    INSERT INTO stream_changes_log (id, change_type, streamer_name, start_date, title, avg_viewers, peak_viewers, followers_gained, subscribers_gained, language)
    VALUES (NEW.streamID, 'INSERT', NEW.streamer_name, NEW.start_date, NEW.title, NEW.avg_viewers, NEW.peak_viewers, NEW.followers_gained, NEW.subscribers_gained, NEW.language);
END;

CREATE TRIGGER log_stream_changes_update
AFTER UPDATE ON stream
FOR EACH ROW
BEGIN
    INSERT INTO stream_changes_log (id, change_type, streamer_name, start_date, title, avg_viewers, peak_viewers, followers_gained, subscribers_gained, language)
    VALUES (NEW.streamID, 'UPDATE', NEW.streamer_name, NEW.start_date, NEW.title, NEW.avg_viewers, NEW.peak_viewers, NEW.followers_gained, NEW.subscribers_gained, NEW.language);
END;

CREATE TRIGGER log_stream_changes_delete
AFTER DELETE ON stream
FOR EACH ROW
BEGIN
    INSERT INTO stream_changes_log (id, change_type, streamer_name, start_date, title, avg_viewers, peak_viewers, followers_gained, subscribers_gained, language)
    VALUES (OLD.streamID, 'DELETE', OLD.streamer_name, OLD.start_date, OLD.title, OLD.avg_viewers, OLD.peak_viewers, OLD.followers_gained, OLD.subscribers_gained, OLD.language);
END;



--Create a trigger that updates the follower_count
CREATE TRIGGER update_follower_count
AFTER INSERT ON stream
FOR EACH ROW
BEGIN
    UPDATE stream
    SET follower_count = follower_count + NEW.followers_gained
    WHERE name = NEW.streamer_name;
END;

--Create a trigger that updates the subscriber_count
CREATE TRIGGER update_subscriber_count
AFTER INSERT ON stream
FOR EACH ROW
BEGIN
    UPDATE stream
    SET subscriber_count = subscriber_count + NEW.subscribers_gained
    WHERE name = NEW.streamer_name;
END;






