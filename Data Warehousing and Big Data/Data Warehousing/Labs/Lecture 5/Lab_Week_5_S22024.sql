-- *************************************************--
-- SOLUTIONS TO LAB WEEK 5 - Data Warehouseing S2 2024

/* QUESTION 1 (B) */

SELECT PCategory, NULL, NULL, SUM(saleamount) Turnover
FROM victor.SalesFact s, victor.ProductDim p, victor.timedim t, victor.locationdim l
WHERE s.productID = p.productID
              AND s.timeID = t.timeID 
              AND s.LocID = l.locID
              AND PCategory ='Fridge'
GROUP BY PCategory

UNION

SELECT PCategory, Year, NULL, SUM(saleamount) Turnover
FROM victor.SalesFact s, victor.ProductDim p, victor.timedim t, victor.locationdim l
WHERE s.productID = p.productID
              AND s.timeID = t.timeID 
              AND s.LocID = l.locID
              AND PCategory ='Fridge'
GROUP BY PCategory, Year


UNION

SELECT PCategory, Year, Region, SUM(saleamount) Turnover
FROM victor.SalesFact s,victor.ProductDim p, victor.timedim t, victor.locationdim l
WHERE s.productID = p.productID
              AND s.timeID = t.timeID 
              AND s.LocID = l.locID
              AND PCategory ='Fridge'
GROUP BY PCategory, Year, Region;


/* QUESTION 2 */

SELECT companyname, Year, sum(s.saleamount) SALES$
FROM victor.SalesFact s, victor.producerDim p, victor.timedim t, victor.locationdim l
WHERE s.companyid= p.companyid
GROUP BY ROLLUP (companyname, Year);



/* QUESTION 3 */
SELECT PCategory, Year, Region, SUM(s.saleamount) SALES$
FROM victor.SalesFact s, victor.ProductDim p, victor.timedim t, victor.locationdim l
WHERE s.productID= p.productID
AND s.timeID= t.timeID
AND s.LocID= l.locID
AND PCategory='Fridge'
GROUP BY CUBE(PCategory, Year, Region);

/* QUESTION 4 */

SELECT Pr.CompanyName, t.Year, SUM(saleAmount), Avg(SUM(saleAmount)) OVER (PARTITION BY Pr.CompanyName ORDER BY t.Year ROWS 1 PRECEDING) AS Moving_Avg
FROM victor.SalesFact s, victor.ProducerDim pr, victor .TimeDim t 
WHERE s.companyID = pr.companyID
AND s.timeID = t.timeID
AND t.Year BETWEEN 2008 AND 2010
Group BY Pr.CompanyName, t.Year;



/*  QUESTION 5 */

SELECT Pr.CompanyName, t.Year, SUM(saleAmount),
RANK() OVER (ORDER BY SUM(saleAmount) DESC) AS Rank, DENSE_RANK() OVER (ORDER BY SUM(saleAmount) DESC) AS Drank
FROM victor.SalesFact s, victor.ProducerDim pr, victor.TimeDim t 
WHERE s.companyID = pr.companyID
AND s.timeID = t.timeID
AND t.Year BETWEEN 2008 AND 2010
Group BY Pr.CompanyName, t.Year;
