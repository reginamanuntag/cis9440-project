{{ config(materialized="table") }}

with
    date_spine as (

        {{
            dbt_utils.date_spine(
                datepart="day",
                start_date="cast('2017-01-01' as date)",
                end_date="cast('2022-12-31' as date)",
            )
        }}

    )

select
    row_number() over () as date_id,
    date_day,
    extract(day from date_day) as day,
    extract(month from date_day) as month,
    extract(year from date_day) as year

from date_spine
