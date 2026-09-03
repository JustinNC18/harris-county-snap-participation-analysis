"""
05_create_county_lookup.py

Purpose:
Create a county lookup table using ACS county data. This lookup is used to supoort county level rollups for SNAP participation analysis.

Project:
Harris County SNAP Participation Analysis

Source:
U.S. Census Bureau ACS 5-Year Estimates

Output:
county_lookup.csv
"""

import requests
import pandas as pd

API_KEY = "YOUR_API_KEY"

url = (
    f"https://api.census.gov/data/2024/acs/acs5"
    f"?get=NAME&for=county:*&key={API_KEY}"
)

response = requests.get(url)
response.raise_for_status()

data = response.json()

# Convert JSON to DataFrame
df = pd.DataFrame(data[1:], columns=data[0])

# Create full county FIPS code
df["county_fips"] = df["state"] + df["county"]

# Rename columns for clarity
df = df.rename(columns={
    "NAME": "county_name"
})

# Save to CSV
df.to_csv("county_lookup.csv", index=False)

print(df.head())
print(f"\nRows: {len(df)}")
