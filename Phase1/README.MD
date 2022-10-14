
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

![erdiagram](https://user-images.githubusercontent.com/80475070/195927966-020bc3cb-9c63-4217-8984-c900162a3b8d.jpg)

## Translation of the ERD into the relational model as relational schemas

* Relations, Attributes, and Types: 
  - Streamer(name (varchar), follower_count (integer), subscriber_count(integer), account_creation_date(DateTime), partner_status(boolean))
    -  Example Domain: xqc, 10,000,000, 50,000, 08/20/2016, True
    -  Primary Keys and Foreign Keys: name, n/a
  - Streamer_Fact_Table(streamer_name (varchar), stream_code (integer), category_code (integer), chat_code (integer))
    - Example Domain: xqc, 1, 1, 1
    - Primary Keys and Foreign Keys: , streamer_name
  - Stream(stream_code (integer), title (varchar), avg_viewers (float), peak_viewers (integer), followers_gained (integer), subscribers_gained (integer), language (varchar))
    - Example Domain: 1, WELCOME TO THE STREAM, 70,000.234, 100,000, 10,000, 1,000, English
  - Category(category_code (integer), name (varchar), position (integer), avg_viewers (float), peak_viewers (integer), start_code (integer), game_code (integer))
    - Example Domain: 1, Just Chatting, 1, 70,000, 85,000, 2, 2
  - Category_Time(category_start_code (integer), start_time (char), duration (char))
    - Example Domain: 2, 8:00:00 PM, 4 hrs
  - game(game_code (integer), genre (varchar), total_viewers (integer), popularity_rank (integer)
    - 2, Adventure, 100,000, 4
  - chat(chat_code (integer), number_of_chatters (integer), unique_messages (integer))
    - Example Domain: 1, 20,000, 40,000
* Constraints:
* Primary Keys:
* Foreign Keys:


