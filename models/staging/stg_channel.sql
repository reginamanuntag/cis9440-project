select ROW_NUMBER() OVER() AS Channel_ID, *
from (
    select distinct
        Open_Data_Channel_Type as Channel_Name
    from cis9440-project.311.nyc_noise_complaint
)