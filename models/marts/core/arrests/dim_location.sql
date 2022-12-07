{{ config(materialized="table") }}

with
    arrest_location as (select * from {{ ref("stg_location") }}),

    noise_location as (select * from {{ ref("stg_noise_location") }}),

    final as (
        select
            row_number() over () as location_id,
            arrest_location.zipcode,
            arrest_location.borough,
            arrest_location.precinct,
            arrest_location.latitude,
            arrest_location.longitude,
            noise_location.complaint_location_type,
            noise_location.incident_address,
            noise_location.address_type,
            noise_location.street,
            noise_location.city

        from arrest_location
        full join
            noise_location
            on (
                arrest_location.latitude = noise_location.latitude
                and arrest_location.longitude = noise_location.longitude
                and arrest_location.zipcode = noise_location.zipcode
                and arrest_location.borough = noise_location.borough
            )
    )

select *
from final
