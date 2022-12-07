with
    offenses as (
        select distinct
            ky_cd as offense_code, ofns_desc as description, law_cat_cd as offense_level

        from {{ source("arrest", "nyc_arrests") }}
    )
select row_number() over () as offense_id, *
from offenses
