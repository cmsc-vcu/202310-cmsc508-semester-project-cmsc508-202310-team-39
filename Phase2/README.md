# Phase 2 README Update

## Contextualization

Twitch is a live streaming platform consisting of thousands of different streamers each competing for the attention of a selective pool of viewers. Each streamer can broadcast themselves solely interacting with their chats (consisting of the live comments from viewers) or playing a wide variety of games. In order to discover new streamers, viewers can browse through different sections or categories based on the content of the stream. For example, if a viewer wanted to watch a streamer just interacting with their chat or watch them interact with people physically in the real world, they would go to the Just Chatting category and the In Real Life (IRL) category respectively. If the viewer wanted to watch a streamer play a specific game, for example World of Warcraft, then they would visit the World of Warcraft category. The main metrics for comparing the importance or success of different streamers is by the live viewer count (how many people are currently watching said streamer live), although other metrics can be used like number of followers (similar to a YouTube subscription so that the viewer can see whenever the streamer is live), subscriptions (typically $5/month subscription as a donation to the streamer), or position within their stream category (ex: the stream with the highest number of concurrent viewers in the World of Warcraft category would have a category position of #1). Since growing as a streamer can result in financial growth and influence via ad revenue from the viewers or number of subscribers, the “field” of livestreaming is incredibly competitive and therefore most streamers would do anything they could to improve their streaming metrics. The purpose of this project specifically is to collect data from Twitch’s API containing information about the metrics of the top streamers on Twitch (followers gained, views per category) and create a utility for streamers by determining the aspects of their stream which contribute to their success. This utility attempts to solve the problem of streaming growth for both Twitch’s top streamers and new streamers who would like to more deeply understand what allows for someone to be successful on Twitch. In order to populate the data for this database, we plan to collect data (stream title, different stream categories, game genres, stream start time, etc.) from a certain number (N) of Twitch’s most popular streamers over a short period of time (TBD). 

## Queries

* Display a list of each streamer and their most streamed Twitch category
* Who are the top 5 streamers with the highest concurrent viewers?
* What was the number of characters on average in streamers’ stream titles?
* Which streamer has the most subscriptions per average view count?
* Find the maximum number of followers gained in one stream
* How many streamers averaged over 10,000 concurrent viewers?
* Which weekday were streamers most likely to go live on?
* Select the streamer with the most consistent viewership
* Display a list of each streamer’s rank/position and their average stream start time
* Display a list of each game genre and their respective average viewership 
* What was the most common language spoken in each stream?
* Display a list of each streamer’s age and their number of followers
* Find the median number of characters in each streamers’ name
* Which state was the most popular for Twitch streamers to stream from? 
* What was the oldest game streamed?
* Which game was most commonly streamed? 
* What was the average stream time?
* How many viewers did the top 5 streamers average?
* What month had the highest spike in followers? 
* What game was the least popular to stream?
* Display a list of top 10 streamers ranked by join date. 


## ER Diagram

![erdiagram3](https://user-images.githubusercontent.com/80475070/195957339-5b5070a4-8f65-4bdd-bd3b-e3cc35d556ce.jpg)

## Translation of the ERD into the relational model as relational schemas

* Relational Schemas:
  - Streamer(name (varchar), follower_count (integer), subscriber_count(integer), account_creation_date(DateTime), partner_status(boolean))
    -  Example Domain: xqc, 10,000,000, 50,000, 08/20/2016, True
    -  Primary Keys and Foreign Keys: name, n/a
    -  Constraints: name (primary key), follower_count/subscriber_count (check >= 0)
  - Stream(streamer_name (varchar), title (varchar), avg_viewers (float), peak_viewers (integer), followers_gained (integer), subscribers_gained (integer), language (varchar), start_date(DateTime))
    - Example Domain: pokimane, WELCOME TO THE STREAM, 70,000.234, 100,000, 10,000, 1,000, English, 10/14/2022)
    - Primary Keys and Foreign Keys: {streamer_name, start_date}, streamer_name
    - Constraints: {streamer_name, start_date} (primary key), streamer_name(foreign key), avg_viewers/peak_viewers/followers_gained/subscribers_gained (check >=0)
  - Category(name (varchar), position (integer), avg_viewers (float), peak_viewers (integer), start_time (DateTime), duration_in_hours (integer))
    - Example Domain: Just Chatting, 1, 70,000, 85,000, 10/14/2022 9:00:00 PM, 5
    - Primary Keys and Foreign Keys: name, n/a
    - Constraints: name (primary key), position(check >= 1), avg_viewers/peak_viewers/duration_in_hours (check >= 0)
  - Game(game_name (integer), genre (varchar), total_current_viewers (integer), popularity_rank (integer))
    - Minecraft, Adventure, 100,000, 4
    - Primary Keys and Foreign Keys: game_name, n/a
    - Constraints: game_name(primary key), total_current_viewers (check >= 0), popularity_rank(check>=1)
  - Chat(chat_ID (integer), number_of_chatters (integer), unique_messages (integer))
    - Example Domain: 1, 2,000, 4,000
    - Primary Keys and Foreign Keys: chat_ID, n/a
    - Constraints: chat_id(primary key), number_of_chatters/unique_messages (check >= 1)

## Functional Dependencies

* streamer_name -> follower_count, subscriber_count, account_creation_date, partner_status
* streamer_name, start_date -> title, avg_viewers, peak_viewers, followers_gained, subscribers_gained, language
* category_name ->  position, avg_category_viewers, peak_category_viewers, start_time, duration
* game_name -> genre, total_current_game_viewers, popularity_rank
* chat_ID -> number_of_chatters, unique_messages

## Decomposition into BCNF Form

Since all nonprime fields within the previously listed relational schema are dependent on their respective keys, decomposition of the relations into BCNF is not required. This can be proven via a brief overview of each of the entities described in this document. In the Streamer entity, follower_count, subscriber_count, account_creation_date, and partner_status are dependent on the Streamer's unique Twitch name. Each nonprime attribute solely relates to the Twitch name and do not relate to each other. When accessing one of a Streamer's Streams, you can access their stream title, avg_viewers, peak_viewers, language, start_date, followers_gained, and subscibers_gained with Twitch's API assuming you have the primary key of {streamer_name, start_date}. The same logic continues to apply for each relation in the relational schema.

## Sample Data

### Streamer

| Name     | Follower\_Count | Subscriber\_Count | Account\_Creation\_date | Partner\_Status |
| -------- | --------------- | ----------------- | ----------------------- | --------------- |
| xqc      | 11,263,559      | 81,193            | 9/12/2014               | TRUE            |
| pokimane | 9,244,000       | 3,271             | 6/7/2013                | TRUE            |
| hasanabi | 2,240,000       | 19,628            | 3/23/2018               | TRUE            |

### Stream

| Streamer\_Name | Start\_Date           | Title                   | Avg\_Viewers | Peak\_Viewers | Followers\_Gained | Subscribers\_Gained | Language |
| -------------- | --------------------- | ----------------------- | ------------ | ------------- | ----------------- | ------------------- | -------- |
| xqc            | 10/12/2022 2:30:00 AM | Welcome to the stream   | 76,000       | 100,000       | 23,000            | 1,000               | English  |
| pokimane       | 10/11/2022 5:00:00 PM | Cozy stream today       | 16,000       | 20,000        | 1,000             | 250                 | English  |
| hasnabi        | 10/14/2022 6:00:00 PM | Political content today | 30,000       | 40,000        | 4,000             | 500                 | English  |

### Category

| Category\_Name    | Position | Avg\_Viewers | Peak\_Viewers | Start\_Time         | Duration(hours) |
| ----------------- | -------- | ------------ | ------------- | ------------------- | --------------- |
| Just Chatting     | 2        | 70,000       | 100,000       | 10/12/2022 2:00 AM  | 12              |
| Minecraft         | 1        | 60,000       | 75,000        | 10/14/2022 3:00 AM  | 8               |
| World of Warcraft | 4        | 50,000       | 60,000        | 10/11/2022 11:00 PM | 3               |

### Game

| Game\_Name        | Genre     | Total\_Current\_Viewers | Popularity\_Rank |
| ----------------- | --------- | ----------------------- | ---------------- |
| Minecraft         | Adventure | 100,000                 | 3                |
| World of Warcraft | MMORPG    | 200,000                 | 2                |

### Chat

| Chat\_ID | Number\_of\_Chatters | Unique\_Messages |
| -------- | -------------------- | ---------------- |
| 0        | 30,000               | 60,000           |
| 1        | 8,000                | 16,000           |
| 2        | 15,000               | 30,000           |
