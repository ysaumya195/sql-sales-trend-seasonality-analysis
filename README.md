
📊 SQL Sales Trend & Seasonality Analysis

 📌 Project Overview
This project performs an end-to-end analysis of retail sales data using PostgreSQL.  
The objective is to uncover trends, growth patterns, and seasonality in sales performance.

The analysis follows a structured data workflow:
- Data Import
- Data Profiling
- Data Cleaning
- Time Series Preparation
- Trend Analysis (Moving Averages)
- Growth Analysis (Monthly Growth Rate)
- Seasonality Detection

---

## 🗂️ Dataset
The dataset represents retail sales transactions and includes:
10K Rows
11 Columns including

Data was cleaned and transformed into a time-series format for analysis.

---

## ⚙️ Tools & Technologies
- **PostgreSQL**
- **pgAdmin**
- **SQL (Window Functions, CTEs, Aggregations)**

---

## 🔄 Project Workflow

### 1. Data Import
- Imported raw CSV data into PostgreSQL

### 2. Data Profiling
- Checked for null values, duplicates, and inconsistencies

### 3. Data Cleaning
- Removed duplicates
- Standardized formats
- Converted date fields

### 4. Time Series Preparation
- Created continuous date series
- Aggregated daily revenue
- Handled missing dates using `COALESCE`

### 5. Moving Average Analysis
- Calculated 7-day and 30-day moving averages
- Smoothed short-term fluctuations
- Compared daily revenue with trend lines

### 6. Monthly Growth Analysis
- Aggregated monthly revenue
- Calculated month-over-month growth using `LAG()`
- Identified growth and decline periods

### 7. Seasonality Detection
- Calculated seasonality index using monthly averages
- Identified high and low demand periods

---

## 📈 Key Analysis

### 🔹 Moving Averages
- Used to reduce noise in daily sales data
- Helped identify underlying patterns

### 🔹 Monthly Growth Rate
- Revealed inconsistent growth patterns
- Highlighted sharp fluctuations in performance

### 🔹 Seasonality Index
- Identified recurring monthly performance patterns
- Highlighted peak sales periods

---

## 💡 Key Insights

- Revenue is highly volatile and driven by short-term spikes
- No consistent long-term growth trend observed
- Monthly performance fluctuates significantly
- Sales are influenced by intermittent high-performing periods
- Peak sales period begins in **September** and continues through **December**
- Highest performance observed in **November and December**
- Retail sales show strong **seasonality patterns**

---

## 🧠 Summary

- **Trend** → No consistent long-term stability  
- **Growth** → Irregular and fluctuating  
- **Seasonality** → Strong, with peak demand from September to December  

---

## 📁 Project Structure
