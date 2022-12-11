-- phase2-ddl.sql


-- drop list

drop table if exists Chat;
drop table if exists Category;
drop table if exists Stream;
drop table if exists Streamer;
drop table if exists Game;


-- task 1: create tables

create table Streamer(
    name varchar(255) unique,
    age int not null,
    follower_count int NOT NULL,
    subscriber_count int NOT NULL,
    account_creation_date varchar(255),
    partner_status boolean,
    primary key(name)
);
create table Stream(
    streamID int not null AUTO_INCREMENT, 
    streamer_name varchar (255),
    start_date varchar(255),
    title varchar(255),
    avg_viewers float NOT NULL, 
    peak_viewers int NOT NULL, 
    followers_gained int NOT NULL,
    subscribers_gained int NOT NULL,
    language varchar(255),
    primary key (streamID),
    foreign key (streamer_name) references Streamer(name)
);
create table Category(
    category_name varchar(255),
    position int not null,
    avg_category_viewers float not null,
    peak_category_viewers int not null,
    start_time varchar(255),
    duration_in_hours int not null,
    streamID int not null,
    primary key (category_name),
    foreign key (streamID) references Stream(streamID) 
);
create table Game(
    game_name varchar(255) unique,
    game_genre varchar(255),
    total_current_viewers int not null,
    game_popularity_rank int not null unique,
    game_release_date varchar(255),
    primary key(game_name)
);
create table Chat(
    chat_ID int not null AUTO_INCREMENT, 
    num_chatters int not null,
    unique_messages int not null,
    streamID int not null, 
    primary key (chat_ID),
    foreign key (streamID) references Stream(streamID)
);


-- task 2: insert values
insert into Streamer(name, age, follower_count, subscriber_count, account_creation_date, partner_status) values
    ('xQc', 27, 11263559, 81193, '9/12/2014', TRUE),
    ('pokimane', 26, 9200000, 4000, '6/7/2013', TRUE),
    ('hasanabi', 32, 8000000, 50000, '3/23/2018', TRUE),
    ('erobb221', 27, 1000000, 3000, '8/12/2016', TRUE),
    ('clintstevens', 24, 2000000, 1500, '7/6/2015', TRUE)
;
insert into Stream(streamer_name, start_date, title, avg_viewers, peak_viewers, followers_gained, subscribers_gained, language) values
    ('xQc', '12/9/2022', 'Welcome to the stream!', 70000, 100000, 5000, 400, 'French'),
    ('pokimane', '12/10/2022', 'Welcome to the stream!', 20000, 23000, 4000, 500, 'English'),
    ('hasanabi', '12/11/2022', 'Welcome to the stream!', 30000, 50000, 3000, 500, 'Turkish'),
    ('erobb221', '12/12/2022', 'Welcome to the stream!', 6000, 7000, 1000, 100, 'French'),
    ('clintstevens', '12/13/2022', 'Welcome to the stream!', 4000, 6000, 1000, 200, 'English')
;
insert into Category (streamID, category_name, position, avg_category_viewers, peak_category_viewers, start_time, duration_in_hours) values
    (1, 'Just Chatting', 1, 200000, 400000, '4:00PM', 5),
    (2, 'Minecraft', 1, 200000, 400000, '4:00PM', 5),
    (3, 'World of Warcraft', 1, 200000, 400000, '4:00PM', 5),
    (4, 'Magic the Gathering', 1, 200000, 400000, '4:00PM', 5),
    (5, 'IRL', 1, 200000, 400000, '4:00PM', 5)
;
insert into Game(game_name, game_genre, total_current_viewers, game_popularity_rank, game_release_date) values 
    ('Minecraft', 'Sandbox', 100000, 5, '2011-11-18'),
    ('Grand Theft Auto V', 'Open World', 100000, 4, '2013-9-17'),
    ('Hearthstone', 'TCG', 100000, 2, '2014-11-3'),
    ('Fallout 4', 'Survival', 100000, 3, '2015-11-10'),
    ('Polybridge', 'Puzzle', 100000, 1, '2015-6-30')
;
insert into Chat(streamID, num_chatters, unique_messages) values 
    (1, 70000, 200000),
    (2, 20000, 30000),
    (3, 30000, 40000),
    (4, 5000, 10000),
    (5, 6000, 8000)
;
