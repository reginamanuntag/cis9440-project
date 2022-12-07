select
<<<<<<< HEAD
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
 
from {{ source('arrest', 'nyc_arrests') }}
=======
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

from {{ source('arrest', 'nyc_arrests') }}
>>>>>>> d40ac0cb23408d83cee734a4a45abdb862984bea
