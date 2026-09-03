"""
04_pull_hud_crosswalk.py

Purpose:
Retrieve HUD USPS crosswalk data for Texas ZIP Codes.

Project:
Harris County SNAP Participation Opportunity Analysis

Source:
HUD USPS ZIP Crosswalk API

Output:
hud_usps_crosswalk.csv
"""

import requests
import pandas as pd

# Actual API token removed from code
# Note that type is set to 1 which will return values for the ZIP to Tract file and query is set to TX which will return Zip Codes in Texas
url = "https://www.huduser.gov/hudapi/public/usps?type=1&query=TX"
token = "YOUR_HUD_API_TOKEN"
headers = {"Authorization": "Bearer {0}".format(HUD_token)}

response = requests.get(url, headers = headers)

if response.status_code != 200:
	print ("Failure, see status code: {0}".format(response.status_code))
else:
	df = pd.DataFrame(response.json()["data"]["results"])
	print(df)

df.to_csv('hud_usps_crosswalk.csv', index=False)
