SELECT {{ dbt_utils.surrogate_key(
      'Unique_Key',
      'Created_Date'
  ) }}  as Date_ID, 

Created_Date,

Unique_Key,

{{ dbt_date.day_of_month("Created_Date") }} as Day,

{{ dbt_date.month_name("Created_Date") }} as Month,

cast({{ dbt_date.date_part('year', 'Created_Date') }} as {{ type_int() }}) as Year

FROM cis9440-project.311.nyc_noise_complaint