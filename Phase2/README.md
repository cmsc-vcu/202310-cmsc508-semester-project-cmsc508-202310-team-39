# Phase 2 README

## Contextualization
Twitch is a live streaming platform consisting of thousands of different streamers each competing for the attention of a selective pool of viewers. Each streamer can broadcast themselves solely interacting with their chats (consisting of the live comments from viewers) or playing a wide variety of games. In order to discover new streamers, viewers can browse through different sections or categories based on the content of the stream. For example, if a viewer wanted to watch a streamer just interacting with their chat or watch them interact with people physically in the real world, they would go to the Just Chatting category and the In Real Life (IRL) category respectively. If the viewer wanted to watch a streamer play a specific game, for example World of Warcraft, then they would visit the World of Warcraft category. The main metrics for comparing the importance or success of different streamers is by the live viewer count (how many people are currently watching said streamer live), although other metrics can be used like number of followers (similar to a YouTube subscription so that the viewer can see whenever the streamer is live), subscriptions (typically $5/month subscription as a donation to the streamer), or position within their stream category (ex: the stream with the highest number of concurrent viewers in the World of Warcraft category would have a category position of #1). 

Since growing as a streamer can result in financial growth and influence via ad revenue from the viewers or number of subscribers, the “field” of livestreaming is incredibly competitive and therefore most streamers would do anything they could to improve their streaming metrics. Initially, the purpose of this project was to specifically collect data from Twitch’s API containing information about the metrics of the top streamers on Twitch and create a utility for streamers by determining the aspects of their stream which contribute to their success. Currently, we are using sample data that does not necessarily reflect the current metrics of certain streamers, but our SQL queries still would be effective at isolating the tendencies of successful streamers relatively effectively. 

This utility attempts to solve the problem of streaming growth for both Twitch’s top streamers and new streamers who would like to more deeply understand what allows for someone to be successful on Twitch. The potential users of this SQL Database implementation could be aspiring streamers who would like to know how to improve their streams, popular streamers who want to keep tabs on the actions of other popular streamers, or laymen like us who are just interested in the data. In order to populate the data for this database, we generated believable sample data from streamers like xQc, pokimane, and hasanabi. There are 5 entities in our database, Stream, Streamer, Category, Game, and Chat, so things like the personal characteristics of streamers (age, partner status, follower count) are recorded along with information about each of their streams like the categories they streamed, the games they played, and information about their chats.

Unfortunately, due to time constraints, we were unable to create a fully fleshed out PHP website with CRUD operations demonstrating our SQL database. If we did, I would have wanted to create a login page for users and admin, where users would be able to view 20 different queries about our database and the admins would be able to perform CRUD (Create, Update, Delete) operations on the values in our SQL tables. However, we still created the 20 different queries in a separate DML file in this repository and our website still has a login feature that displays our 20 queries.

## Queries

* How many streamers average over 10,000 viewers?
* Display a list of each game genre and their total current viewers
* What were the top 3 most common languages spoken in each stream?
* Display a list of each Streamer's age and their number of followers
* What were the top 2 oldest games streamed?
* Find the average number of characters in each streamers’ name
* What is the average number of characters on average in streamers' stream titles? Find the offset between the average and each streamer's title.
* Which streamer has the most subscriptions per average view count?
* Which day was most commonly streamed?
* Calculate the end_time for one of xQc's streams
* Now calculate the duration of each of xQc's streams
* Who gained the most followers collectively in one stream?
* There is a very big difference in the atmosphere of a chatroom that is just spamming the same messages verses a chatroom with actual unique thought. Which streamer had the most unique chatters per average view_count?
* Create a list of the amount of money each Twitch streamer made from subscriptions. Make sure that partnered streamers earn $3 for each subscription, and non-partnered streamers make $2.5.
* Find the number of games played across each stream; don't include Personal categories like Just Chatting. Look at the different genre categories.
* Now rank each game according to the number of hours streamed
* Wow! How interesting! I wonder why Minecraft is the most streamed game? Anyways, now I want you to figure out if total hours streamed for a game correlates with their game rank!
* Huh. I guess it kinda does. Create a query that adds the follower and subcriber count for each of the streams  to the respective streamer. Make this a new column.
* Now calculate the percent increase in follower/subscribers over these streams.
* Finally, find the number of unique message per number of chatters for each stream

## Experience

We found that this project was a great way to catalog the skills we learned throughout the semester. It was great being able to contextualize an idea, and then through iterations, see that idea come to life. We learned a tremendous amount about databases, queries, and the many ways that data can be visualized. While there were some issues in our communication and scheduling during the First Phase of our Project, especially involving the inital creation of the ER diagram, we feel that during the 2nd phase of the project we were more forward about our expectations for the allocation of work and formed some semblance of a plan a few weeks before the Phase 2 deadline. One thing that I personally learned about myself (Luke) when conducting this project was that I need for there to be clearly defined roles/deadlines established for our work ahead of time in order to fully succeed. If we had to do this project again, we would try to learn more about PHP and website design. We felt like we truly grasped the database fundamentals but felt disappointed that we fell short of 100% mastery due to not fully grasping PHP. This is something we believe could be further expanded on next year. We looked forward to website creation and were saddened to have spent little time on it. 


## Improvement to the Project for Future Classes
Our suggestion is that next term, more in-class time be spent on the subject. For example, when we came back from Thanksgiving break and were explained the different intricacies of the Phase 2 project, I remember thinking, "I wish we were able to go over this earlier." Maybe for future classes, the first Phase 2 project code example could be shown after we completed Assignment 4 so that the students would have more time to strategize and work on everything? Also, we think it would be helpful if the PHP requirement for the Phase 2 project was mentioned at an earlier time so the future students would have more time to follow the PHP tutorials/become acquainted with PHP.

## Presentation and Website Links:

(http://cmsc508.com/202310/team39/)

https://user-images.githubusercontent.com/80475070/207757306-c197da9c-2655-4c2c-9aa1-e09c1e6b772f.mp4


## ER Diagram

![real_final_erdiagam](https://user-images.githubusercontent.com/80475070/207744711-2b6a891d-cdb9-4385-8353-2cca9667f78f.jpg)

## Translation of the ERD into the relational model as relational schemas

* Relational Schemas:
  - streamer(name (varchar), age (integer), follower_count (integer), subscriber_count(integer), account_creation_date(Date), partner_status(boolean))
    -  Example Domain: xqc, 27, 10,000,000, 50,000, 08/20/2016, True
    -  Primary Keys and Foreign Keys: name, n/a
    -  Constraints: name (primary key), follower_count/subscriber_count
  - Stream(streamID (integer), streamer_name (varchar), start_date(DateTime), title (varchar), avg_viewers (float), peak_viewers (integer), followers_gained (integer), subscribers_gained (integer), language (varchar)))
    - Example Domain: 1, pokimane, 10/14/2022, WELCOME TO THE STREAM, 70,000.234, 100,000, 10,000, 1,000, English)
    - Primary Keys and Foreign Keys: streamID, streamer_name
    - Constraints: {streamer_name, start_date} (primary key), streamer_name (foreign key), streamer_name(foreign key)
  - Category(category_name (varchar), position (integer), avg_category_viewers (float), peak_categories_viewers (integer), start_time (time), duration_in_hours (integer), streamID (int))
    - Example Domain: Just Chatting, 1, 70,000, 85,000, 10/14/2022 9:00:00 PM, 5, 1
    - Primary Keys and Foreign Keys: {streamID, start_time}, streamID
    - Constraints: {streamID, start_time} (primary key), streamID (foreign key)
  - Game(game_name (varchar), game_genre (varchar), total_current_viewers (integer), game_popularity_rank (integer), game_release_date(Date), streamID (integer))
    - Minecraft, Sandbox, 100,000, 4, 1
    - Primary Keys and Foreign Keys: game_name, streamID
    - Constraints: game_name(primary key), streamID (foreign key)
  - Chat(chat_ID (integer), num_chatters (integer), unique_messages (integer), streamID (integer))
    - Example Domain: 1, 2,000, 4,000, 1
    - Primary Keys and Foreign Keys: chat_ID, streamID
    - Constraints: chat_id(primary key), streamID (foreign key)

## Functional Dependencies

* name -> age, follower_count, subscriber_count, account_creation_date, partner_status
* streamID -> streamer_name, start_date, title, avg_viewers, peak_viewers, followers_gained, subscribers_gained, language
* streamID, start_time ->  category_name, position, avg_category_viewers, peak_category_viewers, start_time, duration_in_hours
* game_name -> game_genre, total_current_game_viewers, game_popularity_rank, game_release_date, game_category_type
* chat_ID -> number_of_chatters, unique_messages, streamID

## Decomposition into BCNF Form

Since all nonprime fields within the previously listed relational schema are dependent on their respective keys, decomposition of the relations into BCNF is not required. This can be proven via a brief overview of each of the entities described in this document. In the Streamer entity, follower_count, subscriber_count, account_creation_date, and partner_status are dependent on the Streamer's unique Twitch name. Each nonprime attribute solely relates to the Twitch name and do not relate to each other. When accessing one of a Streamer's Streams, you can access their stream title, avg_viewers, peak_viewers, language, start_date, followers_gained, and subscibers_gained with Twitch's API assuming you have the primary key of {streamer_name, start_date}. The same logic continues to apply for each relation in the relational schema.

# Data

### Streamer

|name        |age|follower_count|subscriber_count|account_creation_date|partner_status|
|------------|---|--------------|----------------|---------------------|--------------|
|clintstevens|24 |2000000       |1500            |2015-07-06           |0             |
|erobb221    |27 |1000000       |3000            |2016-08-12           |1             |
|hasanabi    |32 |8000000       |50000           |2018-03-23           |1             |
|pokimane    |26 |9200000       |4000            |2013-06-07           |1             |
|xQc         |27 |11263559      |81193           |2014-09-12           |1             |

### Stream

|streamID    |streamer_name|start_date|title|avg_viewers|peak_viewers|followers_gained|subscribers_gained|language|
|------------|-------------|----------|-----|-----------|------------|----------------|------------------|--------|
|1           |xQc          |2022-12-10 22:06:30|WELCOME TO THE GODDAMN STREAM BROTHER! 18 HOUR STREAM INCOMING!|70000      |100000      |5000            |400               |French  |
|2           |xQc          |2022-12-11 20:04:01|yo   |70000      |100000      |5000            |400               |French  |
|3           |pokimane     |2022-12-10 12:00:05|Valorant!|20000      |23000       |4000            |500               |English |
|4           |hasanabi     |2022-12-10 11:08:10|Politics and shit|30000      |50000       |3000            |500               |Turkish |
|5           |erobb221     |2022-12-10 17:24:12|not ending stream until i land on mars|6000       |7000        |1000            |100               |French  |
|6           |clintstevens |2022-12-10 18:00:00|Welcome to the stream!|4000       |6000        |1000            |200               |English |
|7           |clintstevens |2022-12-14 18:00:00|Polybridge|4000       |6000        |1000            |200               |English |

### Game

|game_name   |game_genre|total_current_viewers|game_popularity_rank|game_release_date|game_category_type|streamID|
|------------|----------|---------------------|--------------------|-----------------|------------------|--------|
|Hearthstone |TCG       |100000               |2                   |2014-11-03       |NULL              |4       |
|Minecraft   |Sandbox   |100000               |5                   |2011-11-18       |NULL              |1       |
|Polybridge  |Puzzle    |100000               |1                   |2015-06-30       |NULL              |6       |
|Super Mario 64|Platformer|100000               |3                   |1996-06-23       |NULL              |5       |
|Valorant    |Shooter   |100000               |4                   |2020-06-02       |NULL              |3       |

### Category

|category_name|position|avg_category_viewers|peak_category_viewers|start_time|duration_in_hours|streamID|
|-------------|--------|--------------------|---------------------|----------|-----------------|--------|
|Just Chatting|2       |70000               |100000               |22:06:30  |1                |1       |
|Minecraft    |1       |75000               |78000                |23:06:30  |5                |1       |
|Just Chatting|2       |80000               |95000                |20:04:01  |8                |2       |
|Valorant     |1       |200000              |400000               |16:00:00  |5                |3       |
|Hearthstone  |1       |200000              |400000               |16:00:00  |5                |4       |
|Super Mario 64|1       |200000              |400000               |16:00:00  |5                |5       |
|Polybridge   |4       |5000                |10000                |18:00:00  |4                |6       |

### Chat

|chat_ID     |num_chatters|unique_messages|streamID|
|------------|------------|---------------|--------|
|1           |70000       |200000         |1       |
|2           |20000       |30000          |2       |
|3           |30000       |40000          |3       |
|4           |5000        |10000          |4       |
|5           |6000        |8000           |5       |

#### Best Wishes!

I hope whoever reached the end of this page has a nice day!
