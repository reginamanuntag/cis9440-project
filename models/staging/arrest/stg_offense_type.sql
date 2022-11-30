{{ config(materialized='view') }}

select
    OFNS_DESC as Description,
    KY_CD as Offense Code,
    LAW_CAT_CD as Offense Level 

from {{ source('Arrest', 'nyc_arrests') }}
