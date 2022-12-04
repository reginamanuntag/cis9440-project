select
  Arrest_Key,
  Perpetrator_ID,
  Offense_ID,
  Location_ID,
  Date_ID

from {{ ref('dim_offense_type') }}

left join {{ ref('dim_perpetrator_profile') }} using (Arrest_Key)

left join {{ ref('dim_location') }} using (Arrest_Key)

left join {{ ref('dim_date') }} using (Arrest_Key)