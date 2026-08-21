# Harris County SNAP Participation Opportunity Analysis
> Identifying communities with high SNAP eligibility and lower estimated participation across Harris County.

![Static Badge](https://img.shields.io/badge/Built%20With-white)
![Static Badge](https://img.shields.io/badge/Census%20API%20-%20Blue)
![Static Badge](https://img.shields.io/badge/HUD%20API%20-%20Green)
![Static Badge](https://img.shields.io/badge/Python-orange)
![Static Badge](https://img.shields.io/badge/BigQuery-blue)
![Static Badge](https://img.shields.io/badge/SQL-black)
![Static Badge](https://img.shields.io/badge/Tableau-purple)


## 🎯 Project Overview
This project analyzes potential SNAP participation opportunities using 2024 American Community Survey (ACS) data, HUD USPS Zip Code Crosswalks, and open data sources. The analysis estimates the population below 125% of the Federal Poverty Level and compares it to estimated SNAP participants to identify geographic areas with the largest opportunity gaps.

<table>
  <tr>
    <td width="35%" valign="top">

## 📊 Key Findings
### 💻 130+ Zip Codes
Analyzed in Harris County
### 📉 Two Major Opportunity Areas
North-Northwest Houston and
South-Southwest Houston
### 📈 Many high-need areas
Already show 60% + estimated participation
### 🔍 Targeted Outreach
Can focus where participation appears lowest

</td>
<td width="65%" valign="right">

<img width="1855" height="778" alt="SNAP Gap Map Screenshot" src="https://github.com/user-attachments/assets/830d7604-9ae4-4e31-9237-83003a6d7af2" />

</td>
</tr>
</table>

## 🛠 Methodology
### 💹 ACS C17002       ➡            🏠 ACS S2201          ➡          👥ACS B25010       ➡          🔎BigQuery         ➡         📊 Analysis
The above 3 census tables were pulled into BigQuery and integrated into a dataset. These tables bring together data on population below 125% FPL, HH's receiving SNAP and Avg. HH size. Analysis on participation rates compared to estimated eligible was mapped onto Tableau dashboard.




