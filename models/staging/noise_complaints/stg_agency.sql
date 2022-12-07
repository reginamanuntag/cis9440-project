select row_number() over () as agency_id, *
from (
    select distinct agency_name
     
    from {{ source("311", "nyc_noise_complaint") }}
)
