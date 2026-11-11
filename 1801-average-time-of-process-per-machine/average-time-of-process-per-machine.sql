with activity_pivot as
(select machine_id
    ,process_id
    ,SUM(CASE WHEN activity_type = 'start' then timestamp else NULL end) as start_time
    ,SUM(CASE WHEN activity_type = 'end' then timestamp else NULL end) as end_time
from Activity
group by machine_id, process_id)

select machine_id
    ,round(avg(end_time-start_time), 3) as processing_time
from activity_pivot
group by machine_id;