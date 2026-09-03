# SQL BigQuery Uploads and Dataset Creation

* **Table Uploads**: Tables `C17002`, `S2201`, and `B25010` pulled from previous Python steps were uploaded to a new BigQuery dataset named `snap_gap_analysis`.
* **Crosswalk Sheet Merging**: Crosswalk zip and county lookup sheets pulled from previous Python steps were merged and edited in Excel before uploading to BigQuery.
* **ZIP Code Matching**: `VLOOKUP` was used to match ZIP codes to a county name using the geo IDs of the ZIP codes.
* **Duplicate Removal**: Since USPS ZIP codes can exist under multiple counties, duplicate ZIP codes were removed by keeping only one county per ZIP code. This was done by keeping the county with the highest residential ratio (`res_ratio`) for each ZIP code.
* **Final Dataset Upload**: The resulting `zip_crosswalk_unique_zip` CSV was uploaded to the BigQuery `snap_gap_analysis` dataset.


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
