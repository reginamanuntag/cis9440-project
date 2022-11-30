select
    {{ dbt_utils.surrogate_key(
      'ARREST_KEY',
      'PERP_SEX'
  ) }} as Perpetrator_ID,
    ARREST_KEY as Arrest_Key,
    PERP_SEX as Sex,
    PERP_RACE as Race,
    AGE_GROUP as Age_Group

from {{ source('Arrest', 'nyc_arrests') }}
