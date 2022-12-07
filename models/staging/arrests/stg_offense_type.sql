with offenses as (
    select distinct 
        KY_CD as Offense_Code,
        OFNS_DESC as Description,
        LAW_CAT_CD as Offense_Level

    from {{ source('arrest', 'nyc_arrests') }}
)
select ROW_NUMBER() OVER() AS Offense_ID, *
from offenses