## C17002 2024 data. JSON to CSV.ipynb

import requests
import pandas as pd

url = "https://api.census.gov/data/2024/acs/acs5?get=NAME,C17002_001E,C17002_002E,C17002_003E,C17002_004E,C17002_005E,C17002_006E,C17002_007E&for=zip%20code%20tabulation%20area:*&key=9581abccba273ad7455fdfdeb2389836241b4f1c"


data = requests.get(url).json()

df = pd.DataFrame(data[1:], columns=data[0])

df.to_csv("acs_snap_eligibility.csv", index=False)

print(df.head())

## Saved results to csv
