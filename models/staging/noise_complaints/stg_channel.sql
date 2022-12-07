select row_number() over () as channel_id, *
from (
    select distinct open_data_channel_type as channel_name

    from {{ source("311", "nyc_noise_complaint") }}
)
