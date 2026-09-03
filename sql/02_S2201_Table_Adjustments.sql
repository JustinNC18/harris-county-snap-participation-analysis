**
02_S2201_Table_Adjustments.sql

Purpose:
Cleanup adjustments for table S2201.
  
Project:
Harris County SNAP Participation Opportunity Analysis

Source:
snap-gap-analysis dataset in BigQuery.

**

--Create new table with zip codes column as string without leading zero cutoff. Rename other columns.--
CREATE OR REPLACE TABLE `snap-gap-analysis.snap_gap.acs_2024_S2201` AS
	SELECT
	  LPAD(CAST(`zip code tabulation area` AS STRING), 5, '0') AS zcta,
	  CAST(S2201_C01_001E AS INT64) AS total_households,
	  CAST(S2201_C03_001E AS INT64) AS households_receiving_snap
FROM `snap-gap-analysis.snap_gap.acs_2024_S2201`;

--Output: Cleaned up S2201 Table.
