select row_number() over () as complaint_type_id, *
from (
    select distinct complaint_type as complaint_type_name, descriptor

    from {{ source("311", "nyc_noise_complaint") }}

    where concat('Complaint_Type', 'Descriptor') is not null
)
