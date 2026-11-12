SELECT *
FROM Cinema
WHERE description NOT LIKE 'boring'
    AND id % 2 <> 0
ORDER BY rating desc;