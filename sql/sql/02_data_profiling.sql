
-- ==================== DATA PROFILING : SUPERSTORE DATASET ===================



------------------------------ DATA OVERVIEW ------------------------------

-- Dataset
SELECT * FROM superstore_data_raw LIMIT 10

-- Size of dataset
SELECT COUNT(*) FROM superstore_data_raw

-- Columns
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'superstore_data_raw'

-- Unique orders
SELECT COUNT(DISTINCT order_id) FROM superstore_data_raw

-- Timeline
SELECT MIN(order_date), MAX(order_date) FROM superstore_data_raw

-- Cities
SELECT DISTINCT(city) FROM superstore_data_raw

-- Checking consistency of date format
SELECT DISTINCT(order_date) FROM superstore_data_raw
-- Inconsistencies in date format are observed

-- Looking for highest lowest and typical order size to detect possible outliers
SELECT
MIN(sales) AS min_order,
MAX(sales) AS max_order,
AVG(sales) AS avg_order
FROM superstore_data_raw;

--------------------------------- DUPLICATE DETECTION --------------------------------

-- Duplicates
SELECT order_id, COUNT(*)
FROM superstore_data_raw
GROUP BY order_id
HAVING COUNT(*)>1

-- Orders can contain multiple products, so multiple rows per order_id are expected

-- Checking for complete duplicates
WITH absolute_duplicates AS (SELECT *,
     RANK() OVER(PARTITION BY order_id, order_date, ship_date, customer_id, city, product_id,
	 category,product_name, quantity, sales, profit) AS absolute_duplicates
FROM superstore_data_raw)
SELECT * FROM absolute_duplicates WHERE  absolute_duplicates>1

-- Some duplicates identified

------------------------------- MISSING VALUES --------------------------------------

  -- Checking NULLS
SELECT
COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
COUNT(*) FILTER (WHERE order_date IS NULL) AS missing_order_dates,
COUNT(*) FILTER (WHERE ship_date  IS NULL) AS missing_ship_date,
COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customers,
COUNT(*) FILTER (WHERE city IS NULL) AS missing_city,
COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
COUNT(*) FILTER (WHERE category IS NULL) AS missing_category,
COUNT(*) FILTER (WHERE product_name IS NULL) AS missing_product_name,
COUNT(*) FILTER (WHERE sales IS NULL) AS missing_sales,
COUNT(*) FILTER (WHERE quantity IS NULL) AS missing_quantity,
COUNT(*) FILTER (WHERE profit IS NULL) AS missing_profit
FROM superstore_data_raw

-- NO NULLS detected








