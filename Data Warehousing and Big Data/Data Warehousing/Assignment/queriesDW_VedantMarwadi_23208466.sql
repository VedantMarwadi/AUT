-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Question 1 ---
SELECT
    c.country_iso_code AS "Country ISO CODE",
    c.country_name AS "Country Name",
    SUM(s.amount_sold) AS "SALES"
FROM
    sh.sales s
JOIN
    sh.customers cu ON s.cust_id = cu.cust_id
JOIN
    sh.countries c ON cu.country_id = c.country_id
GROUP BY
    c.country_iso_code, c.country_name
ORDER BY
    "SALES" DESC
FETCH FIRST 3 ROWS ONLY;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Question 2 ---

SELECT
    t.calendar_year AS CALENDAR_YEAR,
    p.prod_name AS PROD_NAME,
    SUM(s.quantity_sold) AS TOTAL_QUANTITY
FROM
    sh.sales s
JOIN
    sh.products p ON s.prod_id = p.prod_id
JOIN
    sh.customers cust ON s.cust_id = cust.cust_id
JOIN
    sh.countries c ON cust.country_id = c.country_id
JOIN
    sh.times t ON s.time_id = t.time_id
WHERE
    c.country_iso_code = 'US'  
    AND t.calendar_year BETWEEN 1998 AND 2001
GROUP BY
    t.calendar_year, p.prod_name
HAVING
    SUM(s.quantity_sold) = (
        SELECT MAX(SUM(s2.quantity_sold))
        FROM sh.sales s2
        JOIN sh.products p2 ON s2.prod_id = p2.prod_id
        JOIN sh.customers cust2 ON s2.cust_id = cust2.cust_id
        JOIN sh.countries c2 ON cust2.country_id = c2.country_id
        JOIN sh.times t2 ON s2.time_id = t2.time_id
        WHERE
            c2.country_iso_code = 'US'
            AND t2.calendar_year = t.calendar_year
        GROUP BY
            p2.prod_name
    )
ORDER BY
    t.calendar_year, TOTAL_QUANTITY DESC;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Question 3 ---
WITH Max_Product_2001 AS (
    SELECT
        s.prod_id,
        SUM(s.amount_sold) AS total_sales
    FROM
        sh.sales s
    JOIN
        sh.times t ON s.time_id = t.time_id
    WHERE
        EXTRACT(YEAR FROM t.time_id) = 2001
    GROUP BY
        s.prod_id
    ORDER BY
        total_sales DESC
    FETCH FIRST 1 ROWS ONLY
),
Product_Transaction_Details AS (
    SELECT
        s.prod_id,
        s.channel_id,
        c.channel_desc,
        COUNT(s.prod_id) AS num_trans,
        SUM(s.quantity_sold) AS total_quantity
    FROM
        sh.sales s
    JOIN
        sh.channels c ON s.channel_id = c.channel_id
    JOIN
        Max_Product_2001 mp ON s.prod_id = mp.prod_id
    GROUP BY
        s.prod_id, s.channel_id, c.channel_desc
)
SELECT
    p.prod_id AS "PROD_ID",
    p.prod_name AS "PRODUCT_NAME", 
    pt.channel_id AS "CHANNEL_ID",
    pt.channel_desc AS "CHANNEL_DESC",
    pt.num_trans AS "NUM_TRANS",
    pt.total_quantity AS "TOTAL_QUANTITY"
FROM
    Product_Transaction_Details pt
JOIN
    sh.products p ON pt.prod_id = p.prod_id;
    

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Question 4 ---
SELECT
    c.country_iso_code AS "COUNTRY_ISO_CODE",
    c.country_name AS "COUNTRY_NAME",
    SUM(s.amount_sold) AS "SALES$"
FROM
    sh.sales s
JOIN
    sh.customers cu ON s.cust_id = cu.cust_id
JOIN
    sh.countries c ON cu.country_id = c.country_id
JOIN
    sh.times t ON s.time_id = t.time_id
WHERE
    EXTRACT(YEAR FROM t.time_id) = 1998
GROUP BY
    c.country_iso_code, c.country_name
ORDER BY
    "SALES$" ASC
FETCH FIRST 3 ROWS ONLY;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Question 5 ---
CREATE MATERIALIZED VIEW Promotion_Analysis_mv
BUILD IMMEDIATE
REFRESH COMPLETE
AS
SELECT 
    s.promo_id, 
    s.prod_id, 
    SUM(s.amount_sold) AS total_sales
FROM 
    sh.sales s
JOIN
    sh.products p ON s.prod_id = p.prod_id
JOIN 
    sh.promotions pr ON s.promo_id = pr.promo_id
GROUP BY 
    s.promo_id, 
    s.prod_id;


SELECT 
    promo_id, 
    prod_id, 
    total_sales
FROM 
    Promotion_Analysis_mv


-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Question 6 ---
SELECT 
    promo_id, 
    prod_id, 
    SUM(total_sales) AS total_sales,
    CASE
        WHEN GROUPING(promo_id) = 1 AND GROUPING(prod_id) = 1 THEN 'Grand Total'
        WHEN GROUPING(prod_id) = 1 THEN 'Product Total'
        ELSE 'Detail'
    END AS summary_level
FROM 
    Promotion_Analysis_mv
GROUP BY 
    ROLLUP(promo_id, prod_id)
ORDER BY 
    promo_id, prod_id;
    
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Question 7 ---
SELECT 
    p.prod_subcategory AS product_subcategory,
    SUM(fps.dollars) AS total_sales
FROM 
    sh.fweek_pscat_sales_mv fps
JOIN 
    sh.products p ON fps.prod_subcategory = p.prod_subcategory
GROUP BY 
    p.prod_subcategory
ORDER BY 
    total_sales DESC
FETCH FIRST 5 ROWS ONLY;

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------