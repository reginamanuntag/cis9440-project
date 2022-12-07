with arrest_location as (
    select * 
    from {{ ref('stg_location') }}
),

noise_location as (
    select *
    from {{ ref('stg_noise_location') }}
),

final as (
    SELECT ROW_NUMBER() OVER() as Location_ID, 
    arrest_location.Zipcode, 
    arrest_location.Borough, 
    arrest_location.Precinct,
    arrest_location.Latitude,
    arrest_location.Longitude,
    noise_location.Complaint_Location_Type, 
    noise_location.Incident_Address,
    noise_location.Address_Type, 
    noise_location.Street, 
    noise_location.City

    FROM arrest_location
    FULL JOIN noise_location on 
    (arrest_location.Latitude=noise_location.Latitude 
    and
    arrest_location.Longitude=noise_location.Longitude
    and
    arrest_location.Zipcode=noise_location.Zipcode
    and
    arrest_location.Borough=noise_location.Borough)
)

select * from final