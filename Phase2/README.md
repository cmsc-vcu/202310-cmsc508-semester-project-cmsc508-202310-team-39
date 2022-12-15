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


