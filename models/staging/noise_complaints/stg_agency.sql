select ROW_NUMBER() OVER() AS Agency_ID, *
from (
    select distinct Agency_Name
    
    from {{ source('311', 'nyc_noise_complaint') }}
)