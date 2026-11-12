SELECT user_id
    ,COUNT(follower_id) as followers_count
FROM Followers
GROUP BY 1
ORDER BY user_id asc;