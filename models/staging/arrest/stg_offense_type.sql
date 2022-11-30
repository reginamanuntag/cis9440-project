{{ config(materialized='view') }}

select
    OFNS_DESC as Description,
    KY_CD as Offense_Code,
    LAW_CAT_CD as Offense_Level 

from {{ source('Arrest', 'nyc_arrests') }}
