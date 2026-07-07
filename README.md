# World Layoffs Data Cleaning Project (SQL)

## Project Overview
In this project, I took a massive, uncleaned dataset of global company layoffs and built a multi-step data cleaning pipeline using MySQL. The goal was to transform raw, messy data into a structured format ready for analysis.

## Key Skills Demonstrated
* **Duplicate Removal:** Used `ROW_NUMBER()` and Window Functions (`PARTITION BY`) to isolate and delete duplicate rows.
* **Standardizing Text:** Handled trailing spaces using `TRIM()` and unified inconsistent naming conventions (e.g., standardizing 'Crypto%' variations).
* **Fixing Missing Data:** Used advanced `SELF-JOINS` to dynamically fill in blank and `NULL` values in the industry columns based on matching company records.
* **Data Type Conversion:** Transformed date records from text strings into proper standardized dates using `STR_TO_DATE()`.
* **Schema Alteration:** Utilized `ALTER TABLE` and `DROP COLUMN` to clean up temporary structural columns after processing.
