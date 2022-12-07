with location as (
  select distinct
    Zipcode,
    ARREST_BORO as Borough,
    ARREST_PRECINCT as Precinct,
    ROUND(Latitude, 6) as Latitude,
    ROUND(Longitude, 6) as Longitude

  from {{ source('arrest', 'nyc_arrests') }}
)
select ROW_NUMBER() OVER() AS Location_ID, *
from location