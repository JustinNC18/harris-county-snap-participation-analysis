"""

03_pull_b25010.py

Purpose:
Retrieve ACS 2024 B25010 average household size data for all ZIP Code
Tabulation Areas (ZCTAs) and save results as a CSV file.

Project:
Harris County SNAP Participation Opportunity Analysis

Source:
U.S. Census Bureau ACS 5-Year Estimates

Output:
acs_B25010.csv
"""

import requests
import pandas as pd

# Census API key removed from source code
API_KEY = "YOUR_CENSUS_API_KEY"

# ACS B25010 variables

url = "https://api.census.gov/data/2024/acs/acs5?get=NAME,B25010_001E&for=zip%20code%20tabulation%20area:*&key={API_KEY}"

# Request data from Census API
data = requests.get(url).json()

df = pd.DataFrame(data[1:], columns=data[0])

#Save results to csv
df.to_csv("acs_B25010.csv", index=False)

#Validation output
print(df.head())
