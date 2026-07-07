-- removing duplicate

SELECT *
FROM layoffs;

CREATE TABLE layoff_edit
LIKE layoffs;

INSERT INTO layoff_edit
SELECT *
FROM layoffs;

SELECT *
FROM layoff_edit;

SELECT *, ROW_NUMBER() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS ROW_NUM
FROM layoff_edit;

WITH D_cte AS (
SELECT *, ROW_NUMBER() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS ROW_NUM
FROM layoff_edit

) 
SELECT *
FROM D_cte
where ROW_NUM > 1;

CREATE TABLE `layoff_edit2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `ROW_NUM` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoff_edit2
WHERE ROW_NUM > 1;

INSERT INTO layoff_edit2
SELECT *, ROW_NUMBER() OVER(
partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS ROW_NUM
FROM layoff_edit;

DELETE
FROM layoff_edit2
WHERE ROW_NUM > 1;

SELECT *
FROM layoff_edit2
WHERE ROW_NUM > 1;



SELECT *
from layoff_edit2;

 -- COMPANY DATA FIX

UPDATE layoff_edit2
SET company = TRIM(company);

-- LOCATION DATA FIX

SELECT DISTINCT location 
from layoff_edit2;

SELECT *
FROM layoff_edit2
WHERE location LIKE 'MAL%';

UPDATE layoff_edit2 t1
JOIN layoff_edit2 t2 
ON t2.company = 'Boozt'
SET t1.location = t2.location
WHERE t1.company = 'Oatly';

select *
from layoff_edit2 t1
JOIN layoff_edit2 t2 
ON t2.company = 'Boozt'
WHERE t1.company = 'Oatly';

SELECT *
FROM layoff_edit2
WHERE location LIKE '%dorf';

UPDATE layoff_edit2 t1
JOIN layoff_edit2 t2 
ON t2.company = 'Trivago'
SET t1.location = t2.location
WHERE t1.company LIKE 'SPRING%';

-- mistake solving for changing other row info.

SELECT *
FROM layoff_edit2
WHERE company LIKE 'Spring%';

UPDATE layoff_edit
SET location = 'Miami'
WHERE company = 'Springbig';

UPDATE layoff_edit2
SET location = 'SF Bay Area'
WHERE company = 'Spring';

-- solved

-- INDUSTRY DATA FIX

SELECT DISTINCT industry
FROM layoff_edit2
order by 1;

SELECT *
FROM layoff_edit2
WHERE industry LIKE 'Crypto%';

UPDATE layoff_edit2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT *
FROM layoff_edit2
WHERE industry = ''
	OR industry IS NULL;
    
SELECT *
FROM layoff_edit2
WHERE company = 'Airbnb';
    
select *
from layoff_edit2 t1
JOIN layoff_edit2 t2 
	ON t1.company = t2.company
	AND t1.location = t2.location
 WHERE (t1.industry = '' or  t1.industry IS NULL)
 AND (t2.industry IS NOT NULL
 AND t2.industry != '');

UPDATE layoff_edit2 t1
JOIN layoff_edit2 t2 
	ON t1.company = t2.company
	AND t1.location = t2.location
 SET t1.industry = t2.industry   
 WHERE (t1.industry = '' or  t1.industry IS NULL)
 AND (t2.industry IS NOT NULL
 AND t2.industry != '');

-- DATE FIX
SELECT *
FROM layoff_edit2;
    
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoff_edit2;

UPDATE layoff_edit2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');




-- country data fix
 SELECT DISTINCT country
 from layoff_edit2
order by 1;

UPDATE layoff_edit2
SET country = 'United States'
where country LIKE 'United states%';

-- stage fix

SELECT *
FROM layoff_edit2
WHERE stage = '' or stage is NULL;

select *
from layoff_edit2
where company like 'Advat%';
-- no fix

-- delete column

ALTER TABLE layoff_edit2
DROP COLUMN ROW_NUM;

SELECT *
FROM layoff_edit2;




