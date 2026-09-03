"""
01_pull_c17002.py

Purpose:
Retrieve ACS 2024 C17002 poverty data for all ZIP Code
Tabulation Areas (ZCTAs) and save results as a CSV file.

Project:
Harris County SNAP Participation Opportunity Analysis

Source:
U.S. Census Bureau ACS 5-Year Estimates

Output:
acs_snap_eligibility.csv
"""

import requests
import pandas as pd

# Census API key removed from source code
API_KEY = "YOUR_CENSUS_API_KEY"

# ACS C17002 variables

url = "https://api.census.gov/data/2024/acs/acs5?get=NAME,C17002_001E,C17002_002E,C17002_003E,C17002_004E,C17002_005E,C17002_006E,C17002_007E&for=zip%20code%20tabulation%20area:*&key={API_KEY}"

# Request data from Census API
data = requests.get(url).json()

df = pd.DataFrame(data[1:], columns=data[0])

#Save results to csv
df.to_csv("acs_snap_eligibility.csv", index=False)

#Validation output
print(df.head())

