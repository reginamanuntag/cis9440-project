with perp_profile as(
    select distinct 
        PERP_SEX as Sex,
        PERP_RACE as Race,
        AGE_GROUP as Age_Group

    from {{ source('arrest', 'nyc_arrests') }}
)
select ROW_NUMBER() OVER() AS Perpetrator_ID, *
from perp_profile