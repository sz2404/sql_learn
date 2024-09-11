select 
'Unique Squirrel ID' as unique_squirrel_id,
Age,
Running, 
Chasing,
Lat_Long
from 
{{ source('SQL_DBT_demo_source', 'squirrel_census')}}