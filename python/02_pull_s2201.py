"""
02_pull_s2201.py

Purpose:
Retrieve ACS 2024 S2201 estimated SNAP Household enrollment counts for all ZIP Code
Tabulation Areas (ZCTAs) and save results as a CSV file.

Project:
Harris County SNAP Participation Opportunity Analysis

Source:
U.S. Census Bureau ACS 5-Year Estimates
"""

import requests
import pandas as pd

# Census API key removed from source code
API_KEY = "YOUR_CENSUS_API_KEY"

# ACS S2201 variables

url = "https://api.census.gov/data/2024/acs/acs5/subject?get=NAME,S2201_C01_001E,S2201_C03_001E&for=zip%20code%20tabulation%20area:*&key={API_Key}"

# Request data from Census API
data = requests.get(url).json()

df = pd.DataFrame(data[1:], columns=data[0])

#Save results to csv
df.to_csv("acs_S2201.csv", index=False)

#Validation output
print(df.head())
