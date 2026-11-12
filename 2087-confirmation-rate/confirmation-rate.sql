with confirmation_pivot as
    (SELECT user_id
        ,COUNT(CASE WHEN action = 'timeout' then time_stamp else null end) as timeout_count
        ,COUNT(CASE WHEN action = 'confirmed' then time_stamp else null end) as confirmed_count
    FROM Confirmations
    GROUP BY user_id
    )

SELECT s.user_id
    ,coalesce(round(c.confirmed_count/(c.confirmed_count + c.timeout_count), 2), 0) as confirmation_rate
FROM Signups as s
LEFT JOIN confirmation_pivot as c
    ON s.user_id = c.user_id

