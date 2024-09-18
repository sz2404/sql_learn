select 
"Unique Squirrel ID" as unique_squirrel_id,
"Primary Fur Color" as p_fur_color,
Age,
Running, 
Chasing,
Lat_Long
from 
{{ source('SQL_DBT_demo_source', 'squirrel_census')}}