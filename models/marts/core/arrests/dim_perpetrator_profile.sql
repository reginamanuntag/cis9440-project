{{ config(materialized="table") }} 

select * from {{ ref("stg_perpetrator_profile") }}
