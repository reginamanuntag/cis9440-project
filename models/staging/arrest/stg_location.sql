select
   {{ dbt_utils.surrogate_key(
     'ARREST_KEY',
     'Zipcode'
 ) }}  as Location_ID,
   Arrest_Key,
   Zipcode,
   ARREST_BORO,
   ARREST_PRECINCT,
   Latitude,
   Longitude
 
from {{ source('Arrest', 'nyc_arrests') }}
