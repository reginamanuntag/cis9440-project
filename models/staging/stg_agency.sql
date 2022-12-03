select
    ROW_NUMBER() OVER() AS Agency_ID,
    Agency_Name
from cis9440-project.311.noise_complaints