=======================================  DATA IMPORT : SUPERSTORE  ===========================================

    -- RAW TABLE (no assumptions about data types for smooth import) 
    
CREATE TABLE superstore_data_raw_0(
    order_id TEXT,
    order_date TEXT,
    ship_date TEXT,
    customer_id TEXT,
    city TEXT,
    product_id TEXT,
    category TEXT,
    product_name TEXT,
    sales TEXT,
    quantity TEXT,
    profit TEXT
);

-- Copying data from csv to table

COPY superstore_data_raw
FROM 'C:/Users/saumya/OneDrive/Desktop/DATA/superstore.csv'
DELIMITER ','
CSV HEADER;

-- Creating a final raw table-converting sales,profit,quantity as numeric type
-- Date have inconsistent formats which are handeled during cleaning stage

CREATE TABLE superstore_data_raw AS
SELECT 
    order_id TEXT,
    order_date TEXT,
    ship_date TEXT,
    customer_id TEXT,
    city TEXT,
    product_id TEXT,
    category TEXT,
    product_name TEXT,
    sales :: NUMERIC AS sales,
    quantity :: NUMERIC AS quantity,
    profit :: NUMERIC AS profit
FROM superstore_data_raw_0

4. Logical clarity issue

You named:

first table → raw_0
second table → raw

That’s fine, but better naming improves professionalism.


-- =======================================
-- DATA IMPORT : SUPERSTORE
-- =======================================

-- Created staging/raw table (all TEXT for safe import)

CREATE TABLE superstore_data_raw_staging(
    order_id TEXT,
    order_date TEXT,
    ship_date TEXT,
    customer_id TEXT,
    city TEXT,
    product_id TEXT,
    category TEXT,
    product_name TEXT,
    sales TEXT,
    quantity TEXT,
    profit TEXT
);

--  Load CSV into staging table

COPY superstore_data_raw_staging
FROM 'C:/Users/saumya/OneDrive/Desktop/DATA/superstore.csv'
DELIMITER ','
CSV HEADER;

-- Create cleaned raw table with proper data types
-- Date data types will be handled during cleaning as it has inconsistent formats

CREATE TABLE superstore_data_raw AS
SELECT 
    order_id,
    order_date,
    ship_date,
    customer_id,
    city,
    product_id,
    category,
    product_name,
    sales::NUMERIC AS sales,
    quantity::NUMERIC AS quantity,
    profit::NUMERIC AS profit
FROM superstore_data_raw_staging;
