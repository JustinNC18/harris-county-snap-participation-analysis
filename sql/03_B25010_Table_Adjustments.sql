**
03_B25010_Table_Adjustments.sql

Purpose:
Cleanup adjustments for table B25010.
  
Project:
Harris County SNAP Participation Opportunity Analysis

Source:
snap-gap-analysis dataset in BigQuery.

**

--Create new table with zip codes column as string without leading zero cutoff. Rename other columns.--
CREATE OR REPLACE TABLE `snap-gap-analysis.snap_gap.acs_2024_B25010` AS
	SELECT
	  LPAD(CAST(`zip code tabulation area` AS STRING), 5, '0') AS zcta,
	  CAST(B25010_001E AS INT64) AS avg_HH_size
FROM `snap-gap-analysis.snap_gap.acs_2024_B25010`;

--Replace error values with null
UPDATE `snap-gap-analysis.snap_gap.acs_2024_B25010`
SET avg_HH_size = NULL
WHERE avg_HH_size = -666666666;

--Output: Cleaned up B25010 Table.
