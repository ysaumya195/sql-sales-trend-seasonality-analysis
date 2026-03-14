------------------------------------------------------ DATA CLEANING----------------------------------------------------------

-- Create staging table
CREATE TABLE superstore_data_staging
(LIKE superstore_data_raw);

-- Insert cleaned data removing duplicates
INSERT INTO superstore_data_staging
SELECT order_id, order_date, ship_date, customer_id, city, product_id,
category, product_name, quantity, sales, profit
FROM (
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY order_id, order_date, ship_date, customer_id, city, product_id,
category, product_name, quantity, sales, profit
) AS rn
FROM superstore_data_raw
) t
WHERE rn = 1;

-- OR 
INSERT INTO superstore_data_staging
SELECT DISTINCT * FROM superstore_data_raw


-- Fix date data type
ALTER TABLE superstore_data_staging
ALTER COLUMN order_date TYPE DATE
USING TO_DATE(order_date,'YYYY-MM-DD'),

ALTER COLUMN ship_date TYPE DATE
USING TO_DATE(ship_date,'YYYY-MM-DD');


