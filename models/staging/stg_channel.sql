select
    ROW_NUMBER() OVER() AS Channel_ID,
    Open_Data_Channel_Type as Channel_Name
from cis9440-project.311.noise_complaints