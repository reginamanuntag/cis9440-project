SELECT {{ dbt_utils.surrogate_key(
      'ARREST_KEY',
      'ARREST_DATE'
  ) }}  as Date_ID, 

ARREST_DATE,

Arrest_Key,

{{ dbt_date.day_of_month("ARREST_DATE") }} as Date,

{{ dbt_date.month_name("ARREST_DATE") }} as Month,

cast({{ dbt_date.date_part('year', 'ARREST_DATE') }} as {{ type_int() }}) as Year

FROM {{ source('arrest', 'nyc_arrests') }}