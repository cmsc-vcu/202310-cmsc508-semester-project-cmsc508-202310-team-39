-- phase2-ddl.sql


-- drop list

drop table if exists chat;
drop table if exists category;
drop table if exists stream;
drop table if exists streamer;
drop table if exists game;


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
    primary key (category_name),
    foreign key (streamID) references stream(streamID)
);
create table game(
    game_name varchar(255) unique,
    game_genre varchar(255),
    total_current_viewers int not null,
    game_popularity_rank int not null unique,
    game_release_date Date not null,
    primary key(game_name)
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
    ('clintstevens', '2022-12-10 18:00:00', 'Welcome to the stream!', 4000, 6000, 1000, 200, 'English')
;
insert into category (streamID, category_name, position, avg_category_viewers, peak_category_viewers, start_time, duration_in_hours) values
    (1, 'Just Chatting', 1, 200000, 400000, '16:00:00', 5),
    (2, 'Minecraft', 1, 200000, 400000, '16:00:00', 5),
    (3, 'World of Warcraft', 1, 200000, 400000, '16:00:00', 5),
    (4, 'Magic the Gathering', 1, 200000, 400000, '16:00:00', 5),
    (5, 'IRL', 1, 200000, 400000, '16:00:00', 5)
;
insert into game(game_name, game_genre, total_current_viewers, game_popularity_rank, game_release_date) values 
    ('Minecraft', 'Sandbox', 100000, 5, '2011-11-18'),
    ('Grand Theft Auto V', 'Open World', 100000, 4, '2013-9-17'),
    ('Hearthstone', 'TCG', 100000, 2, '2014-11-3'),
    ('Fallout 4', 'Survival', 100000, 3, '2015-11-10'),
    ('Polybridge', 'Puzzle', 100000, 1, '2015-6-30')
;
insert into chat(streamID, num_chatters, unique_messages) values 
    (1, 70000, 200000),
    (2, 20000, 30000),
    (3, 30000, 40000),
    (4, 5000, 10000),
    (5, 6000, 8000)
;
