select row_number() over () as status_id, *
from (
    select distinct status, resolution_description

    from {{ source("311", "nyc_noise_complaint") }}

    where concat('Status', 'Resolution_Description') is not null
)
