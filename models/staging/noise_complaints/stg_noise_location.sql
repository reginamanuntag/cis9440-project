with location as (
  select distinct
   Incident_Zip as Zipcode,
   Borough,
   Location_Type as Complaint_Location_Type,
   Incident_Address,
   Address_Type,
   Street_Name as Street,
   City,
   ROUND(Latitude, 6) as Latitude,
   ROUND(Longitude, 6) as Longitude

  from {{ source('311', 'nyc_noise_complaint') }}
 
  where concat(Location_Type, Incident_Address, Incident_Zip, Street_Name, Location, City, Address_Type) is not null
)

select ROW_NUMBER() OVER() AS Location_ID, *
from location
