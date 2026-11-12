SELECT activity_date as day
    ,COUNT(DISTINCT user_id) as active_users
FROM Activity
WHERE activity_date between (DATE_SUB('2019-07-27', INTERVAL 29 day)) AND '2019-07-27'
GROUP BY 1