SELECT query_name
    ,ROUND(avg(rating/position), 2) as quality
    ,ROUND(
        (
            (COUNT(CASE WHEN rating < 3 then rating else null end)/COUNT(*))
            *100), 2) as poor_query_percentage
FROM Queries
GROUP BY 1;