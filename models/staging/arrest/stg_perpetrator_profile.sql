{{ config(materialized='view') }}

select
    PERP_SEX as Sex,
    PERP_RACE as Race,
    AGE_GROUP as Age_Group

from {{ source('Arrest', 'nyc_arrests') }}
