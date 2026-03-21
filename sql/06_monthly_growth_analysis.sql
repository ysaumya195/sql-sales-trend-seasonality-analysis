-- --------------------------- MONTHLY TREND & GROWTH ANALYSIS ---------------------------

WITH monthly_sales AS (
    SELECT 
           DATE_TRUNC('month', calendar_date) AS month,
           SUM(daily_total_sales_revenue) AS monthly_revenue
    FROM time_series_sales
    GROUP BY 1
	
)

SELECT 
       month,
       monthly_revenue,

       LAG(monthly_revenue) OVER (ORDER BY month) AS previous_month_revenue,

       ROUND(
           (
               monthly_revenue - LAG(monthly_revenue) OVER (ORDER BY month)
           ) 
           / NULLIF(LAG(monthly_revenue) OVER (ORDER BY month), 0) * 100.0
       ,2) AS monthly_growth_rate_pct,

       CASE 
           WHEN monthly_revenue > LAG(monthly_revenue) OVER (ORDER BY month) THEN 'Growth'
           WHEN monthly_revenue < LAG(monthly_revenue) OVER (ORDER BY month) THEN 'Decline'
           ELSE 'No Change'
       END AS trend_direction

FROM monthly_sales
ORDER BY month;

-- ------------------------------------ INSIGHTS ------------------------------------

-- • Monthly revenue does not exhibit a consistent upward growth pattern.
--   Instead, the data shows frequent fluctuations between growth and decline periods.

-- • Several months show negative growth rates, indicating short-term declines
--   in revenue compared to the previous month.

-- • However, these declines are interspersed with occasional sharp growth spikes,
--   suggesting that revenue is driven by irregular high-performing periods 
--   rather than steady growth.

-- • The presence of extreme positive growth rates (e.g., >100%) indicates 
--   sudden increases in sales, which may be due to seasonal demand, promotions,
--   or bulk orders.

-- • Overall, the sales pattern reflects a highly volatile retail environment,
--   where performance varies significantly month-to-month rather than following
--   a stable growth trajectory.
