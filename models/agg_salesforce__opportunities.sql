
select stage_name, count(*) as stage_count, round(avg(amount), 0) as stage_average 
from {{source('hrncir_sf', 'opportunity')}} group by stage_name