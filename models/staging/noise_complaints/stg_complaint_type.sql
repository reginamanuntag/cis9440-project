select ROW_NUMBER() over() As Complaint_Type_ID, 
Unique_Key as Complaint_ID,
Complaint_Type As Complaint_Type_Name, 
Descriptor 

from {{ source('311', 'nyc_noise_complaint') }}