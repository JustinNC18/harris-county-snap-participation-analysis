# Tableau Dashboard

Interactive Dashboard:

https://public.tableau.com/app/profile/justin.chacko/viz/HarrisCountySNAPGapAnalysis/SNAPGapAnalysis-HarrisCounty


# Tableau Opportunity Categories
The following calculated field was used to classify zip codes into opportunity categories.

**

IF [Eligible 125 Fpl Pct] < 0.10 
THEN "Lower Poverty Areas"

ELSEIF [Eligible 125 Fpl Pct] >= 0.20 AND [Participation Rate] < 0.50 
THEN "Highest Opportunity (<50% and FPL >20%)"

ELSEIF [Eligible 125 Fpl Pct] >= 0.10 AND [Participation Rate] < 0.50 
THEN "Higher Opportunity (<50%)"

ELSEIF [Eligible 125 Fpl Pct] >= 0.10 AND [Participation Rate] < 0.60 
THEN "Moderate-High (50%-60%)"

ELSEIF [Eligible 125 Fpl Pct] >= 0.10 AND [Participation Rate] < 0.70 
THEN "Moderate (60%-70%)"

ELSE "Lower Opportunity (>70%)"
END

**

--Output: Color Coded Opportunity map

<img width="274" height="153" alt="image" src="https://github.com/user-attachments/assets/71626c35-ba43-404b-a350-14945946e23e" />



