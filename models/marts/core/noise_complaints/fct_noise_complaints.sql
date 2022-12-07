{{ config(materialized="table") }}

with
    noise_data as (
        select round(latitude, 6) as latitude, round(longitude, 6) as longitude, *
        from {{ source("311", "nyc_noise_complaint") }}
    ),

    date_dim as (select * from {{ ref("dim_date") }}),

    location_dim as (select * from {{ ref("dim_location") }}),

    agency_dim as (select * from {{ ref("dim_agency") }}),

    channel_dim as (select * from {{ ref("dim_channel") }}),

    status_dim as (select * from {{ ref("dim_complaint_status") }}),

    complaint_type_dim as (select * from {{ ref("dim_complaint_type") }})

select
    unique_key as complaint_id,
    channel_id,
    agency_id,
    status_id,
    complaint_type_id,
    date_id,
    location_id

from noise_data
left join date_dim on (date_dim.date = noise_data.created_date)
left join location_dim on (location_dim.zipcode = noise_data.incident_zip)
left join agency_dim on (agency_dim.agency_name = noise_data.agency_name)
left join channel_dim on (channel_dim.channel_name = noise_data.open_data_channel_type)
left join
    status_dim
    on (
        status_dim.status = noise_data.status
        and status_dim.resolution_description = noise_data.resolution_description
    )
left join
    complaint_type_dim
    on (
        complaint_type_dim.complaint_type_name = noise_data.complaint_type
        and complaint_type_dim.descriptor = noise_data.descriptor
    )
