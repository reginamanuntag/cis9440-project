with date_dim as (
    select * from {{ ref('dim_date') }}
),

location_dim as (
    select * from {{ ref('dim_location') }}
),

offense_dim as (
    select * from {{ ref('dim_offense_type') }}
),

perp_dim as (
    select * from {{ ref('dim_perpetrator_profile') }}
)

select ARREST_KEY as Arrest_ID,
Date_ID,
Location_ID,
Offense_ID,
Perpetrator_ID
from {{ source('arrest', 'nyc_arrests') }}
left join date_dim on (date_dim.Date_Day=nyc_arrests.Arrest_Date)
left join location_dim on (location_dim.Latitude=nyc_arrests.Latitude)
left join offense_dim on (offense_dim.Description=nyc_arrests.OFNS_DESC)
left join perp_dim on (perp_dim.Race=nyc_arrests.PERP_RACE)