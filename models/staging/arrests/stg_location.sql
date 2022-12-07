with
    location as (
        select distinct
            zipcode,
            arrest_boro as borough,
            arrest_precinct as precinct,
            round(latitude, 6) as latitude,
            round(longitude, 6) as longitude

        from {{ source("arrest", "nyc_arrests") }}
    )
select row_number() over () as location_id, *
from location
