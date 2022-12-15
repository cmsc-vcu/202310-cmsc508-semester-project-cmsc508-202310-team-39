# Phase 2 README

## Contextualization
Twitch is a live streaming platform consisting of thousands of different streamers each competing for the attention of a selective pool of viewers. Each streamer can broadcast themselves solely interacting with their chats (consisting of the live comments from viewers) or playing a wide variety of games. In order to discover new streamers, viewers can browse through different sections or categories based on the content of the stream. For example, if a viewer wanted to watch a streamer just interacting with their chat or watch them interact with people physically in the real world, they would go to the Just Chatting category and the In Real Life (IRL) category respectively. If the viewer wanted to watch a streamer play a specific game, for example World of Warcraft, then they would visit the World of Warcraft category. The main metrics for comparing the importance or success of different streamers is by the live viewer count (how many people are currently watching said streamer live), although other metrics can be used like number of followers (similar to a YouTube subscription so that the viewer can see whenever the streamer is live), subscriptions (typically $5/month subscription as a donation to the streamer), or position within their stream category (ex: the stream with the highest number of concurrent viewers in the World of Warcraft category would have a category position of #1). 

Since growing as a streamer can result in financial growth and influence via ad revenue from the viewers or number of subscribers, the “field” of livestreaming is incredibly competitive and therefore most streamers would do anything they could to improve their streaming metrics. Initially, the purpose of this project was to specifically collect data from Twitch’s API containing information about the metrics of the top streamers on Twitch and create a utility for streamers by determining the aspects of their stream which contribute to their success. Currently, we are using sample data that does not necessarily reflect the current metrics of certain streamers, but our SQL queries still would be effective at isolating the tendencies of successful streamers relatively effectively. 

This utility attempts to solve the problem of streaming growth for both Twitch’s top streamers and new streamers who would like to more deeply understand what allows for someone to be successful on Twitch. The potential users of this SQL Database implementation could be aspiring streamers who would like to know how to improve their streams, popular streamers who want to keep tabs on the actions of other popular streamers, or laymen like us who are just interested in the data. In order to populate the data for this database, we generated believable sample data from streamers like xQc, pokimane, and hasanabi. There are 5 entities in our database, Stream, Streamer, Category, Game, and Chat, so things like the personal characteristics of streamers (age, partner status, follower count) are recorded along with information about each of their streams like the categories they streamed, the games they played, and information about their chats.

Unfortunately, due to time constraints, we were unable to create a PHP website demonstrating our SQL database. If we did, I would have wanted to create a login page for users and admin, where users would be able to view 20 different queries about our database and the admins would be able to perform CRUD (Create, Update, Delete) operations on the values in our SQL tables. However, we still created the 20 different queries in a separate DML file in this repository.

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
## Improvements

We found that this project was a great way to catalog the skills we learned throughout the semester. It was great being able to contextualize an idea, and then through iterations, see that idea come to life. We learned a tremendous amount about databases, queries, and the many ways that data can be visualized. 


## Future Changes
If we had to do this project again, we would try to learn more about PHP and website design. We felt like we truly grasped the database fundamentals but felt disappointed that we fell short of 100% mastery due to not fully grasping PHP. This is something we believe could be further expanded on next year. We looked forward to website creation and were saddened to have spent little time on it. Our suggestion is that next term, more in-class time be spent on the subject. 

## Presentation and Website Links:

(http://cmsc508.com/202310/team39/)


drive.google.com/video_project


## ER Diagram

![real_final_erdiagam](https://user-images.githubusercontent.com/80475070/207744711-2b6a891d-cdb9-4385-8353-2cca9667f78f.jpg)


