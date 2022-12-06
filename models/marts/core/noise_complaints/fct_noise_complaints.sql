select
  Complaint_ID,
  Agency_ID,
  Channel_ID,
  Complaint_Type_ID,
  Status_ID,

from {{ ref('dim_agency') }}

left join {{ ref('dim_channel') }} using (Complaint_ID)

left join {{ ref('dim_complaint_status') }} using (Complaint_ID)

left join {{ ref('dim_complaint_type') }} using (Complaint_ID)

left join {{ ref('dim_noise_date') }} using (Complaint_ID)

left join {{ ref('dim_noise_location') }} using (Complaint_ID)