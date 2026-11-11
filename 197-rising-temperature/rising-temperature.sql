with PreviousWeatherData as
(
    select id
        ,recordDate
        ,lag(recordDate) over (order by recordDate) as previous_date
        ,temperature
        ,lag(temperature) over (order by recordDate) as previous_temp
    from Weather
)

select id as Id
from PreviousWeatherData
where temperature > previous_temp
AND datediff(recordDate, previous_date) = 1;