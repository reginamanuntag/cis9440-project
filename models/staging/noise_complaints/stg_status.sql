select ROW_NUMBER() over() As Status_ID, *
from (
select distinct Status, 
Resolution_Description 

from {{ source('311', 'nyc_noise_complaint') }}

where concat('Status', 'Resolution_Description') is not null
)