-- phase2-ddl.sql


-- drop list

drop table if exists Streamer;
drop table if exists Stream;
drop table if exists Category;
drop table if exists Game;
drop table if exists Chat;

-- task 1: create tables

create table Streamer(
    name varchar(255),
    follower_count int NOT NULL,
    subscriber_count int NOT NULL,
    account_creation_date varchar(255),
    partner_status boolean,
    primary key(name)
);
create table Stream(
    streamer_name varchar (255),
    start_date varchar(255),
    title varchar(255),
    avg_viewers float NOT NULL, 
    peak_viewers int NOT NULL, 
    folowers_gained int NOT NULL,
    subscribers_gained int NOT NULL,
    language varchar(255),
    primary key (streamer_name, start_date),
    foreign key (streamer_name) references Streamer(name)
);
create table Category(
    category_name varchar(255),
    position int not null,
    avg_category_viewers float not null,
    peak_category_viewers int not null,
    start_time varchar(255),
    duration_in_hours int not null,
    primary key (category_name) 
);
create table Game(
    game_name varchar(255),
    game_genre varchar(255),
    total_current_viewers int not null,
    game_popularity_rank int not null,
    primary key(game_name)
);
create table Chat(
    chat_ID int not null, 
    num_chatters int not null,
    unique_messages int not null
);


-- task 2: insert values
insert into Streamer(name, follower_count, subscriber_count, account_creation_date, partner_status) values
    ('xQc', 11263559, 81193, '9/12/2014', TRUE),
    ('pokimane', 9200000, 4000, '6/7/2013', TRUE),
    ('hasanabi', 8000000, 50000, '3/23/2018', TRUE),
    ('erobb221', 1000000, 3000, '8/12/2016', TRUE),
    ('clintstevens', 2000000, 1500, '7/6/2015', TRUE)
;








