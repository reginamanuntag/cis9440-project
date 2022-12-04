WITH date_spine AS (

  {{ dbt_utils.date_spine(
      start_date="to_date('11/01/2009', 'mm/dd/yyyy')",
      datepart="day",
      end_date="dateadd(year, 40, current_date)"
     )
  }}

), calculated as (

    SELECT
      date_day,
      date_day                                                                                AS date_actual,

      DAYNAME(date_day)                                                                       AS day_name,

      DATE_PART('month', date_day)                                                            AS month_actual,
      DATE_PART('year', date_day)                                                             AS year_actual,

      DATE_PART(dayofweek, date_day) + 1                                                      AS day_of_week,

), current_date_information AS (
  
    SELECT 
      fiscal_year AS current_fiscal_year,
      first_day_of_fiscal_year AS current_first_day_of_fiscal_year,
      fiscal_quarter_name_fy AS current_fiscal_quarter_name_fy,
      first_day_of_month AS current_first_day_of_month
    FROM calculated
    WHERE CURRENT_DATE = date_actual

)

SELECT
  calculated.date_day,
  calculated.date_actual,
  calculated.day_name,
  calculated.month_actual,
  calculated.year_actual,
  calculated.day_of_week,

FROM calculated
CROSS JOIN current_date_information


