------------------------------  7 DAY and 30 DAY MOVING AVERAGES  -------------------------------------
-- Moving averages are calculated to smooth short-term fluctuations in daily sales
-- and highlight underlying trends in the data.
-- 
-- A 7-day moving average helps capture weekly patterns and reduces noise caused
-- by daily variability in orders.
--
-- A 30-day moving average provides a longer-term perspective, allowing us to
-- observe broader sales trends and potential seasonality effects.
--
-- By comparing the actual daily revenue with these moving averages, we can
-- better understand whether sales are trending upward, downward, or remaining stable.




SELECT 
       calendar_date,
       daily_total_sales_revenue AS revenue,

       ROUND(
           AVG(daily_total_sales_revenue) OVER(
               ORDER BY calendar_date
               ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
           ),2
       ) AS ma_7_day,

       ROUND(
           AVG(daily_total_sales_revenue) OVER(
               ORDER BY calendar_date
               ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
           ),2
       ) AS ma_30_day

FROM time_series_sales
ORDER BY calendar_date;

-- Note:
-- For the first few days of the dataset, the moving average is calculated
-- using the available observations within the window. As more data becomes
-- available, the moving average gradually stabilizes into the full 7-day
-- and 30-day rolling averages.


------------------------------------  INSIGHTS  ------------------------------------------
-- • The 7-day and 30-day moving averages smooth out daily fluctuations 
--   and provide a clearer view of underlying sales patterns.

-- • No strong long-term upward or downward trend is observed in revenue.
--   Sales remain highly volatile at the daily level.

-- • This volatility is typical of retail data and is likely driven by 
--   irregular purchasing behavior and varying order volumes.

-- • Several instances show sharp deviations of daily revenue from the 
--   7-day moving average, indicating short-term spikes or dips in sales.

-- • These fluctuations may be attributed to factors such as promotions,
--   seasonal demand, or bulk purchasing activity.
