**

05_snap_gap_table_county_export.sql

Purpose:
Export filtered table to csv based on gulf coast counties of future interest. For current project, we will just focus on Harris County.

Project:
Harris County Participation Oppurtunity Analysis

Source:
snap-gap-analysis dataset in BigQuery.

**

SELECT *
FROM `snap-gap-analysis.snap_gap.snap_gap_analysis_2024_3`
WHERE county_name IN (
  'Austin County, Texas' ,
  'Brazoria County, Texas' ,
  'Chambers County, Texas' ,
  'Colorado County, Texas' ,
  'Fort Bend County, Texas' ,
  'Galveston County, Texas' ,
  'Harris County, Texas' ,
  'Liberty County, Texas' ,
  'Matagorda County, Texas' ,
  'Montgomery County, Texas' ,
  'Walker County, Texas' ,
  'Waller County, Texas' ,
  'Wharton County, Texas');

Output: SNAP Participation rates csv file for selected gulf coast counties in Texas.

