**
01_C17002_Table_Adjustments.sql

Purpose:
Cleanup adjustments for table C17002. Create 125% FPL or under columns using the other columns.
  
Project:
Harris County SNAP Participation Opportunity Analysis

Source:
snap-gap-analysis dataset in BigQuery.
**

--Create new table with zip codes column as string without leading zero cutoff. Rename other columns.--
CREATE OR REPLACE TABLE `snap-gap-analysis.snap_gap.acs_2024_C17002` AS
	SELECT
	  LPAD(CAST(`zip code tabulation area` AS STRING), 5, '0') AS zcta,
	  CAST(C17002_001E AS INT64) AS total_population,
	  CAST(C17002_002E AS INT64) AS under_50_fpl,
	  CAST(C17002_003E AS INT64) AS fpl_50_99,
	  CAST(C17002_004E AS INT64) AS fpl_100_124,
	  CAST(C17002_005E AS INT64) AS fpl_125_149,
    CAST(C17002_006E AS INT64) AS fpl_150_184,
CAST(C17002_007E AS INT64) AS fpl_185_199
FROM `snap-gap-analysis.snap_gap.acs_2024_C17002`;

--Create new 125 FPL or under column--
ALTER TABLE `snap-gap-analysis.snap_gap.acs_2024_C17002`
ADD COLUMN eligible_125_fpl INT64;

--Populate new column with sum of relevant FPL columns--
UPDATE `snap-gap-analysis.snap_gap.acs_2024_C17002`
SET eligible_125_fpl = 
		CAST(under_50_fpl AS INT64)
		+CAST(fpl_50_99 AS INT64)
		+CAST(fpl_100_124 AS INT64)
WHERE TRUE;

--Create new column for % population 125 FPL and under--
ALTER TABLE `snap-gap-analysis.snap_gap.acs_2024_C17002`
ADD COLUMN eligible_125_fpl_pct FLOAT64;

UPDATE `snap-gap-analysis.snap_gap.acs_2024_C17002`
SET eligible_125_fpl_pct = 
	SAFE_DIVIDE(eligible_125_fpl, total_population)
WHERE TRUE;

--Output: estimated eligible individuals column and estimated participation rate by zip code. (eligible_125_fpl) (eligible_125_fpl_pct)
