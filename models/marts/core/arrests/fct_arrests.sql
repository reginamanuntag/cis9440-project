{{ config(materialized="table") }}

with
    arrest_data as (
        select round(latitude, 6) as lat, round(longitude, 6) as long, *
        from {{ source("arrest", "nyc_arrests") }}
    ),

    date_dim as (select * from {{ ref("dim_date") }}),

    location_dim as (select * from {{ ref("dim_location") }}),

    offense_dim as (select * from {{ ref("dim_offense_type") }}),

    perp_dim as (select * from {{ ref("dim_perpetrator_profile") }})

select arrest_key as arrest_id, perpetrator_id, offense_id, location_id, date_id
from arrest_data
left join date_dim on (date_dim.date = arrest_data.arrest_date)
left join
    location_dim
    on (
        location_dim.latitude = arrest_data.lat
        and location_dim.longitude = arrest_data.long
        and location_dim.zipcode = arrest_data.zipcode
        and location_dim.borough = arrest_data.arrest_boro
        and location_dim.precinct = arrest_data.arrest_precinct
    )
left join
    offense_dim
    on (
        offense_dim.offense_code = arrest_data.ky_cd
        and offense_dim.description = arrest_data.ofns_desc
        and offense_dim.offense_level = arrest_data.law_cat_cd
    )
left join
    perp_dim
    on (
        perp_dim.race = arrest_data.perp_race
        and perp_dim.sex = arrest_data.perp_sex
        and perp_dim.age_group = arrest_data.age_group
    )
