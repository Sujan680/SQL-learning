-- Data cleaning Project

SELECT * 
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standarize the data
-- 3. Null values or blank values
-- 4. Remove any columns

-- since we are not going to work on the raw data so we created another table
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT * 
FROM layoffs;

-- 1. Remove duplicates data

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
`date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;


WITH duplicate_cte AS
(
	SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
	`date`, stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1
;

-- also making duplicate layoffs_staging2 in order to delete duplicate data
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

INSERT INTO layoffs_staging2
SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
	`date`, stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging
    where row_num > 1;

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

Select *
from layoffs_staging2;


-- Standarize the data

-- checking the company name
SELECT company, TRIM(company)
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET company = TRIM(company);

-- checking the industry name
SELECT *
FROM layoffs_staging2
where industry LIKE 'Crypto%';

SELECT DISTINCT industry
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- now location checking
SELECT DISTINCT location
FROM layoffs_staging2
ORDER BY 1;

-- now country checking
SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY 1;

SELECT *
FROM layoffs_staging2
where country LIKE 'United States%'
ORDER BY 1;

--  THE Trailing (.) is used to remove the .(dot) from data
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_staging2
ORDER BY 1;

-- now updating the table of country column having . after country to United States
UPDATE layoffs_staging
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

select *
from layoffs_staging2;

-- now converting the date to (2012-12-11) this format

SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y') as Stand_Date_Format
From layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;


-- finding null and blank 
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT *
FROM layoffs_staging2
where industry is null
or industry = '';

UPDATE layoffs_staging2
SET industry = NULL
where industry = '';

SELECT *
FROM layoffs_staging2
where company = "Airbnb";

-- since there is blank in the industry so it must filled with values 

SELECT t1.industry, t2.industry
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
    AND t1.location = t2.location
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- deleting the column containing NULL values
DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM layoffs_staging2;

-- Lastly Deleting the column row_num
ALTER TABLE layoffs_staging2
DROP COLUMN row_num;










