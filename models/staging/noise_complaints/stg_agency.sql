select
    ROW_NUMBER() OVER() AS Agency_ID,
    Unique_Key as Complaint_ID,
    Agency_Name
from {{ source('311', 'nyc_noise_complaint') }}