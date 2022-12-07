select ROW_NUMBER() OVER() AS Channel_ID, *
from (
    select distinct
        Open_Data_Channel_Type as Channel_Name
    
    from {{ source('311', 'nyc_noise_complaint') }}
)