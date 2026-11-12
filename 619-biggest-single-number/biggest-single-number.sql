with non_dup as
    (
        SELECT num
        FROM MyNumbers
        GROUP BY 1
        HAVING COUNT(num) = 1 
    )
SELECT MAX(num) as num
FROM non_dup;