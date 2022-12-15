<!DOCTYPE html>
<html>
<head>
  <title>SQL Queries</title>
</head>
<body>
  <h1>SQL Queries</h1>

<?php
  // Connect to the database
    require_once 'config.php';


  // Create an array of SQL queries
  $queries = [
    "SELECT name, avg_viewers FROM streamer a join stream b on (name = streamer_name) WHERE avg_viewers >= 10000",
    "SELECT game_name, game_genre, total_current_viewers FROM game ORDER BY 1",
    "SELECT language, count(language) as lang_count FROM stream GROUP BY language ORDER BY lang_count DESC LIMIT 3",
    "SELECT name, age, follower_count FROM streamer ORDER BY age DESC",
    "SELECT game_name, game_release_date FROM game ORDER BY game_release_date ASC LIMIT 2",
    "with counter_cte as ( SELECT name, LENGTH(name) as lenNames FROM streamer GROUP BY name ) SELECT format(sum(lenNames) / count(name), 1) as avgChar FROM counter_cte",
    "SELECT streamer_name, title,  LENGTH(title) as title_length, format((SELECT AVG(LENGTH(title)) FROM stream), 1) as avg_title_length, abs(format((LENGTH(title) - (SELECT AVG(LENGTH(title)) FROM stream)), 1)) as offset FROM stream order by offset asc", 
    "SELECT name, subscriber_count, avg_viewers, format((subscriber_count / avg_viewers),2) as subs_per_viewcount FROM streamer a join stream b on (name=streamer_name) ORDER BY subs_per_viewcount DESC LIMIT 1", 
    "with day_cte as( SELECT streamer_name, (SELECT(DAYNAME(start_date))) as dayname FROM stream) SELECT dayname, count(dayname) FROM day_cte GROUP by dayname LIMIT 1", 
    "SELECT streamer_name, category_name, start_date, start_time, (SELECT DATE_ADD(start_time, INTERVAL duration_in_hours HOUR)) as end_time, duration_in_hours FROM stream a join category b on (a.streamID=b.streamID) WHERE streamer_name='xQc' and start_date='2022-12-10 22:06:30'",
    "SELECT streamer_name, start_date, SUM(duration_in_hours) as duration FROM stream a 
    join category b on (a.streamID = b.streamID) GROUP by streamer_name, start_date", "SELECT streamer_name, followers_gained, subscribers_gained, (followers_gained+subscribers_gained) as total_gained FROM stream ORDER BY total_gained DESC",
    "SELECT streamer_name avg_category_viewers, unique_messages, (unique_messages/avg_category_viewers) as unique_per_viewers FROM stream a  join category b on (a.streamID = b.streamID) join chat c on (b.streamID = c.streamID) ORDER BY unique_per_viewers DESC",
    "SELECT name, subscriber_count, partner_status, concat('$', ( CASE WHEN partner_status=1 THEN 3*subscriber_count ELSE 0 END) ) as dollars_earned_partnered, concat('$', ( CASE WHEN partner_status=0 THEN 2.5*subscriber_count ELSE 0 END)) as dollars_earned_affiliate FROM streamer ORDER BY dollars_earned_partnered DESC"
  ];

$descriptions = [
  "How many streamers average over 10,000 viewers?",
  "Display a list of each game genre and their total current viewers",
  "What were the top 3 most common languages spoken in each stream?",
  "Display a list of each Streamer's age and their number of followers",
  "What were the top 2 oldest games streamed?",
  "Find the average number of characters in each streamers’ name",
  "What is the average number of characters on average in streamers' stream titles? 
    -- Find the offset between the average and each streamer's title.",
  "Which streamer has the most subscriptions per average viewcount?",
  "Which day was most commonly streamed?",
  "Calculate the end_time for one of xQc's streams",
  "Now calculate the duration of each of xQc's streams",
  "Who gained the most subcribers and followers collectively in 1 stream?",
  "There is a very big difference in the atmosphere of a chatroom that is just spamming the same 
    -- messages verses a chatroom with actual unique thought. Which streamer had the most unique chatters per average view_count?",
  "Create a list of the amount of money each Twitch streamer made from subscriptions. Make sure that partnered streamers
    -- earn $3 for each subscription, and non-partnered streamers make $2.5."
];
  // Loop through the array and execute each query
  $num_query = 1; // variable to keep track of the query number
for ($indx = 0; $indx < count($queries); $indx ++){
  $result = $link->query($queries[$indx]);
  echo "<h2>Query $num_query</h2>";
  echo $descriptions[$indx] . "<br>";
  echo $queries[$indx];
  while ($row = $result->fetch_assoc()) {
    echo "<p>" . implode(", ", $row) . "</p>";
  }
  $num_query++;
}
  // foreach ($queries as $query) {
  //   // Execute the query
  //   $result = $link->query($query);

  //   // Print the results
  //   echo "<h2>Query $num_query</h2>";
  //   echo $query;
  //   while ($row = $result->fetch_assoc()) {
  //     echo "<p>" . implode(", ", $row) . "</p>";
  //   }

  //   $num_query++; // increment the query number
  // }
?>

</body>
</html>
