
## Contextualization

Twitch is a live streaming platform consisting of thousands of different streamers each competing for the attention of a selective pool of viewers. Each streamer can broadcast themselves solely interacting with their chats (consisting of the live comments from viewers) or playing a wide variety of games. In order to discover new streamers, viewers can browse through different sections or categories based on the content of the stream. For example, if a viewer wanted to watch a streamer just interacting with their chat or watch them interact with people physically in the real world, they would go to the Just Chatting category and the In Real Life (IRL) category respectively. If the viewer wanted to watch a streamer play a specific game, for example World of Warcraft, then they would visit the World of Warcraft category. The main metrics for comparing the importance or success of different streamers is by the live viewer count (how many people are currently watching said streamer live), although other metrics can be used like number of followers (similar to a YouTube subscription so that the viewer can see whenever the streamer is live), subscriptions (typically $5/month subscription as a donation to the streamer), or position within their stream category (ex: the stream with the highest number of concurrent viewers in the World of Warcraft category would have a category position of #1). Since growing as a streamer can result in financial growth and influence via ad revenue from the viewers or number of subscribers, the “field” of livestreaming is incredibly competitive and therefore most streamers would do anything they could to improve their streaming metrics. The purpose of this project specifically is to collect data from Twitch’s API containing information about the metrics of the top streamers on Twitch (followers gained, views per category) and create a utility for streamers by determining the aspects of their stream which contribute to their success. This utility attempts to solve the problem of streaming growth for both Twitch’s top streamers and new streamers who would like to more deeply understand what allows for someone to be successful on Twitch. In order to populate the data for this database, we plan to collect data (stream title, different stream categories, game genres, stream start time, etc.) from a certain number (N) of Twitch’s most popular streamers over a short period of time (TBD). 

## Queries

*  Display a list of each streamer and their most streamed Twitch category
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

## ER Diagram

![alt text][https://github.com/cmsc-vcu/202310-cmsc508-semester-project-cmsc508-202310-team-39/blob/515b18320a5565a09a7267a502f45f5b85e6104b/Phase1/erdiagram.jpg]
