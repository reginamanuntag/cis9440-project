select
    {{ dbt_utils.surrogate_key(
      'ARREST_KEY',
      'KY_CD'
  ) }} as Offense_ID,
    ARREST_KEY as Arrest_Key,
    OFNS_DESC as Description,
    KY_CD as Offense_Code,
    LAW_CAT_CD as Offense_Level 

from {{ source('Arrest', 'nyc_arrests') }}
