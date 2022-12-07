select ROW_NUMBER() over() As Complaint_Type_ID, *
from ( 
    select distinct
        Complaint_Type As Complaint_Type_Name, 
        Descriptor 

from {{ source('311', 'nyc_noise_complaint') }}

where concat('Complaint_Type', 'Descriptor') is not null
)