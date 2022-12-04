select
    to_hex(md5(cast(coalesce(cast(Zipcode as STRING), '') || '-' || coalesce(cast(ARREST_PRECINCT as STRING), '') as STRING))) as Location_ID,
    Zipcode,
    ARREST_BORO,
    ARREST_PRECINCT,
    Latitude,
    Longitude

from cis9440-project.Arrest.nyc_arrests