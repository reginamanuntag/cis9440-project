select ROW_NUMBER() OVER() AS Agency_ID, *
from (
    select distinct Agency_Name
    from cis9440-project.311.nyc_noise_complaint
)