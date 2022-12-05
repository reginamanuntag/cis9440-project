select ROW_NUMBER() over() As Status_ID, 
Unique_Key as Complaint_ID,
Status, 
Resolution_Description 

from {{ source('311', 'nyc_noise_complaint') }}