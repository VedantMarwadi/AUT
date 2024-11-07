
/* *************************************************  */
/* SOLUTION TO LAB WEEK 5 - Data Warehouseing S2 2024*/

/* QUESTION 1 (A) */

SELECT Product, NULL, NULL, SUM(turnover) as Turnover_overall
FROM sales0506
WHERE Product = 'Fridge' AND Region IS NOT NULL AND YEAR IS NOT NULL
GROUP BY product;

UNION

SELECT Product, Year, NULL, SUM(turnover) as Turnover_per_year
From sales0506
WHERE Product = 'Fridge' AND Region IS NOT NULL AND YEAR IS NOT NULL
GROUP BY Product, Year

UNION

SELECT Product, Year, Region, SUM(turnover) as Turnover_per_year_and_region
FROM sales0506
WHERE Product = 'Fridge' AND Region IS NOT NULL AND YEAR IS NOT NULL
GROUP BY Product, Year, Region;