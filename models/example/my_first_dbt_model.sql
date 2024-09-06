
{{ config(materialized='table') }}



select * from 
{{ source('SQL_DBT_demo_source', 'squirrel_census')}}

