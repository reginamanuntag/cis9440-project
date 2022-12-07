{{ config(materialized="table") }} 

select * from {{ ref("stg_offense_type") }}
