# SQL BigQuery Uploads and Dataset Creation

Tables C17002, S2201 and B25010 pulled from previous python steps were uploaded to a new BigQuery dataset named 'snap_gap_analysis'
Crosswalk zip and county lookup sheets pulled from previous python steps were merged and edited in excel before uploading to BigQuery.
  -VLOOKUP used to match zip codes to a county name using geo id's of zip codes.
  -Since USPS zip codes exist under multiple counties, duplicate zip codes were removed by keeping only one county per zip code. This was done by keeping the county with the highest residential ratio (res_ratio) for each        zip code.
  -Resulting zip_crosswalk_unique_zip csv was uploaded to Bigquery 'snap_gap_analysis' dataset.

# SQL Workflow

## 01_C17002_Table_Adjustments.sql

Table cleanup and 125% FPL and under columns created.

## 02_cS2201_Table_Adjustments.sql

Table cleanup.

## 03_B25010_Table_Adjustments.sql

Table cleanup.

## 04_snap_gap_analysis_2024_table_creation.sql

Final snap gap analysis table created by joining previous tables and zip crosswalk table. 

## 05_opportunity_categories.sql

Creates Tableau opportunity categories.
