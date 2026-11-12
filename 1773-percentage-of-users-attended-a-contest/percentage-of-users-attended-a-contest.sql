with Users_LOD as
    (SELECT user_id
        ,COUNT(*) OVER() as user_total   
    FROM Users
    )

SELECT r.contest_id
    ,ROUND(((COUNT(r.user_id)/u.user_total)*100),2) as percentage
FROM Register r
LEFT JOIN Users_LOD u
    ON r.user_id = u.user_id
GROUP BY 1
ORDER BY percentage desc, contest_id asc;