with squirrel_gray as (
    select 
    unique_squirrel_id,
    primary_fur_color,
    'Pink' as highlight_fur_color,
    'Cool' as combination_of_primary_and_highlight_color
    from {{ ref('squirrel_colour')}}
    where Primary_Fur_Color = 'Gray'
)

select 
sc.unique_squirrel_id,
sc.primary_fur_color,
{% set columns = ['highlight_fur_color', 'combination_of_primary_and_highlight_color'] %}
{% for col in columns %}
CASE WHEN sc.primary_fur_color = 'Gray' THEN sg.{{col}}
ELSE sc.{{col}}
END AS {{col}}
{% if not loop.last %}, {% endif %}
{% endfor %}
from {{ ref('squirrel_colour')}} as sc
left join squirrel_gray as sg
on sc.unique_squirrel_id = sg.unique_squirrel_id
