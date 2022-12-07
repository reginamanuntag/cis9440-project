select
    {{ dbt_utils.surrogate_key(
      'Unique_Key',
      'Incident_Zip'
  ) }}  as Location_ID,
    Unique_Key,
    Incident_Zip as Zipcode,
    Borough,
    Location_Type as Complaint_Location_Type,
    Incident_Address,
    Address_Type,
    Street_Name as Street,
    City,
    Latitude,
    Longitude
    


from cis9440-project.311.nyc_noise_complaint

where concat(Location_Type, Incident_Address, Incident_Zip, Street_Name, Location, City, Address_Type) is not null