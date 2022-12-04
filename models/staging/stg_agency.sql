select
    ROW_NUMBER() OVER() AS Agency_ID,
    Unique_Key as Complaint_ID,
    Agency_Name
from cis9440-project.311.nyc_noise_complaint