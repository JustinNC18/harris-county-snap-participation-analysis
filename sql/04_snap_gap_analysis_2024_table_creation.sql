**

04_snap_gap_analysis_2024_table_creation.sql

Purpose:
Merge 3 census tables together along with zip crosswalk and county lookup tables to creater final snap gap analysis table.

Project:
Harris County Participation Oppurtunity Analysis

Source:
snap-gap-analysis dataset in BigQuery.

**
CREATE TABLE snap_gap.snap_gap_analysis_2024_3 AS
SELECT
    c.zcta AS zip_code,
    z.geoid AS geoid,
    z.county_fips AS county_fips,
    z.county_name AS county_name,
    z.city AS city,
    z.state AS state,
    c.total_population,
    c.eligible_125_fpl,
    c.eligible_125_fpl_pct,
    s.households_receiving_snap,
    b.avg_HH_size,
    ROUND(s.households_receiving_snap * b.avg_HH_size ) AS est_snap_individuals,

    c.eligible_125_fpl - ROUND(s.households_receiving_snap * b.avg_HH_size) AS enrollment_gap,

    SAFE_DIVIDE(ROUND(s.households_receiving_snap * b.avg_HH_size),c.eligible_125_fpl) AS participation_rate,

FROM snap_gap.acs_2024_C17002 c
LEFT JOIN snap_gap.acs_2024_S2201 s 
    ON c.zcta = s.zcta
LEFT JOIN snap_gap.acs_2024_B25010 b 
    ON c.zcta = b.zcta
LEFT JOIN `snap-gap-analysis.snap_gap.tx_zip_crosswalk_unique_zip` z
    ON c.zcta = LPAD(CAST(z.zip AS STRING), 5, '0');

--Output: SNAP Gap table showing estimated SNAP participation rates by zip code with corresponding counties included.
