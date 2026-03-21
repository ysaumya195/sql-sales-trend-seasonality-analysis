-- --------------------------- MONTHLY SEASONALITY ANALYSIS ---------------------------

WITH daily_totals AS (
    SELECT 
           calendar_date,
           daily_total_sales_revenue AS revenue
    FROM time_series_sales
),

monthly_avg AS (
    SELECT
        EXTRACT(MONTH FROM calendar_date) AS month_number,
        TO_CHAR(calendar_date, 'Month') AS month_name,
        AVG(revenue) AS avg_daily_revenue
    FROM daily_totals
    GROUP BY 1,2
),

overall_avg AS (
    SELECT 
           AVG(revenue) AS overall_avg_revenue
    FROM daily_totals
)

SELECT
    m.month_number,
    TRIM(m.month_name) AS month_name,
    ROUND(m.avg_daily_revenue, 2) AS avg_daily_revenue,

    ROUND(
        m.avg_daily_revenue / o.overall_avg_revenue * 100
    ,2) AS seasonality_index

FROM monthly_avg m
CROSS JOIN overall_avg o
ORDER BY m.month_number;

-- ------------------------------------ INSIGHTS ------------------------------------

-- • The seasonality index highlights variations in sales performance across months.

-- • Months with an index above 100 indicate higher-than-average sales activity,
--   suggesting peak demand periods.

-- • Months with an index below 100 represent relatively weaker sales performance.

-- • The presence of such variation indicates seasonality in the dataset,
--   where certain months consistently outperform others.

-- • These patterns may be driven by factors such as festive seasons,
--   promotions, or changes in consumer demand.
