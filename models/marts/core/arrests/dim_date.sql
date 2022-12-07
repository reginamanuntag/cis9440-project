WITH date_spine AS (

  {{ dbt_utils.date_spine(
      datepart="day",
      start_date="cast('2017-01-01' as date)",
      end_date="cast('2022-12-31' as date)"
     )
  }}

)

    SELECT
    row_number() over() as Date_ID,
      Date_Day,
    EXTRACT (Day FROM Date_Day) as Day,
    EXTRACT (month FROM Date_Day) as Month,
    EXTRACT (year FROM Date_Day) as Year

    FROM date_spine