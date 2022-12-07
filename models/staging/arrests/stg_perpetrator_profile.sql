with
    perp_profile as (
        select distinct perp_sex as sex, perp_race as race, age_group as age_group

        from {{ source("arrest", "nyc_arrests") }}
    )
select row_number() over () as perpetrator_id, *
from perp_profile
