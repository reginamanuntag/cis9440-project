select
  Arrest_Key,
  Perpetrator_ID,
  Offense_ID

from {{ ref('dim_offense_type') }}

left join {{ ref('dim_perpetrator_profile') }} using (Arrest_Key)
