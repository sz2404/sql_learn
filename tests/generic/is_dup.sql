{% test is_dup(model, column_name, column_id) %}

with validation as (

    select
        {{ column_name }} as grouper,
        {{ column_id }} as field

    from {{ model }}

),

validation_errors as (

    select
        concat(grouper, field) as combo

    from validation

)

select *
from validation_errors
where combo is null

{% endtest %}