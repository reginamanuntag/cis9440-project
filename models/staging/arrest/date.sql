WITH date_spine AS (

  {{ dbt_utils.date_spine(
      datepart="day",
      start_date="cast('2019-01-01' as date)",
      end_date="cast('2020-01-01' as date)"
     )
  }}

)

    SELECT
    row_number() over() as date_dim_id,
      date_day,
    EXTRACT (Day FROM date_day) as day,
    EXTRACT (month FROM date_day) as month,
    EXTRACT (year FROM date_day) as year
  

  
 
    FROM date_spine

    
    


