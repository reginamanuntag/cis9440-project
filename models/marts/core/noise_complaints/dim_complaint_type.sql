{{ config(materialized="table") }} 

select * from {{ ref("stg_complaint_type") }}
