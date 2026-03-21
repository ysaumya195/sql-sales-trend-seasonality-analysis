

-- Creating continuous date series to avoid missing dates in time series analysis
-- This ensures days with zero sales are still represented in the dataset

-- Create calendar table
CREATE TABLE date_dimension_table (
calendar_date DATE
);

-- Insert continuous dates
INSERT INTO date_dimension_table
SELECT generate_series(
MIN(order_date),
MAX(order_date),
INTERVAL '1 day'
)::date
FROM superstore_data_staging;

-- Build complete daily time series dataset
CREATE VIEW time_series_sales  AS
SELECT d.calendar_date,
       COALESCE(daily_total_sales_revenue,0) AS daily_total_sales_revenue,
       COALESCE(daily_total_no_of_orders,0) AS daily_total_no_of_product_sold
FROM date_dimension_table d
LEFT JOIN (
    SELECT order_date,
           SUM(sales) AS daily_total_sales_revenue,
           SUM(quantity) AS daily_total_no_of_product_sold
    FROM superstore_data_staging
    GROUP BY order_date
) s
ON d.calendar_date = s.order_date
ORDER BY d.calendar_date;
