-- RAW TABLE (no assumptions about data types)
-- Because CSV data is messy (dates, blanks, mixed formats)

CREATE TABLE superstore_data_raw (
    order_id TEXT,
    order_date TEXT,
    ship_date TEXT,
    ship_mode TEXT,
    customer_id TEXT,
    customer_name TEXT,
    segment TEXT,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    region TEXT,
    product_id TEXT,
    category TEXT,
    sub_category TEXT,
    product_name TEXT,
    sales TEXT,
    quantity TEXT,
    discount TEXT,
    profit TEXT
);

-- Copying data from csv to table

COPY superstore_data_raw
FROM 'C:\Users\saumya\OneDrive\Desktop\DATA\superstore.csv'
DELIMITER ','
CSV HEADER;
