SELECT m.employee_id
    ,m.name
    ,COUNT(e.name) as reports_count
    ,ROUND(avg(e.age)) as average_age
FROM Employees e
INNER JOIN Employees m
    ON e.reports_to = m.employee_id
GROUP BY 1
ORDER BY 1;