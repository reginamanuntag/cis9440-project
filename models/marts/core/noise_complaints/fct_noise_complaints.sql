with date_dim as (
    select * from {{ ref('dim_date') }}
),

location_dim as (
    select * from {{ ref('dim_location') }}
), 

agency_dim as (
    select * from {{ ref('dim_agency') }}
),

channel_dim as (
    select * from {{ ref('dim_channel') }}
),

status_dim as (
    select * from {{ ref('dim_complaint_status') }}
),

complaint_type_dim as (
    select * from {{ ref('dim_complaint_type') }}
) 

select Unique_Key as Complaint_ID,
Channel_ID,
Agency_ID,
Status_ID,
Complaint_Type_ID,
Date_ID,
Location_ID

from {{ source('311', 'nyc_noise_complaint') }}
left join date_dim on (date_dim.Date_Day=nyc_noise_complaint.Created_Date)
left join location_dim on (location_dim.Zipcode=nyc_noise_complaint.Incident_Zip)
left join agency_dim on (agency_dim.Agency_Name=nyc_noise_complaint.Agency_Name)
left join channel_dim on (channel_dim.Channel_Name=nyc_noise_complaint.Open_Data_Channel_Type)
left join status_dim on (status_dim.Status=nyc_noise_complaint.Status and
status_dim.Resolution_Description=nyc_noise_complaint.Resolution_Description)
left join complaint_type_dim on (complaint_type_dim.Complaint_Type_Name=nyc_noise_complaint.Complaint_Type and
complaint_type_dim.Descriptor=nyc_noise_complaint.Descriptor)