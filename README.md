# Telco Customer Churn Analysis | End-to-End Data Analytics Project

## Project Summary

Designed and executed a complete end-to-end data analytics project to analyze customer churn patterns for a telecom company.

The project covers **data cleaning (Python), structured validation & analysis (MySQL), and interactive business dashboard development (Tableau Public)** to generate actionable retention insights.

---

## Business Objective

To identify the key drivers of customer churn and provide data-backed recommendations to reduce churn rate and improve customer retention.

---

## Tech Stack

* **Python (Pandas, NumPy)** – Data Cleaning & Preparation
* **MySQL** – Data Validation & Analytical Queries
* **Tableau Public** – Interactive Dashboard Visualization
* **Jupyter Notebook**

---

## Project Workflow

### 1️⃣ Data Cleaning & Preparation (Python)

* Handled missing values and corrected inconsistent records
* Converted `TotalCharges` to numeric format
* Validated categorical consistency (Yes/No fields, service types)
* Exported structured dataset (`telco_churn_cleaned.csv`) for SQL analysis
* Ensured dataset integrity before database import

---

### 2️⃣ SQL Data Validation & Analysis

Created structured queries to validate and analyze churn behavior:

* Total Customers & Overall Churn Rate
* Churn Rate by Contract Type
* Churn Rate by Payment Method
* Churn by Internet Service Type
* Average Monthly Charges by Churn
* Average Tenure by Churn

All metrics were validated before visualization to ensure dashboard accuracy.

---

### 3️⃣ Interactive Dashboard (Tableau)

Developed a structured dashboard including:

* 3 KPI Cards:

  * Total Customers
  * Churned Customers
  * Overall Churn Rate
* 6 Analytical Visualizations (Stacked Bar Charts & Comparative Views)
* Business-focused layout for executive-level insights

🔗 **Live Dashboard:**
https://public.tableau.com/views/Dashboard_17771682761600/Dashboard1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

---

## Key Analytical Insights

* Overall churn rate: **26.54%**
* Month-to-month contract customers show **42.71% churn rate** (highest risk segment)
* Electronic check users show **45.29% churn rate**
* Customers with shorter tenure churn significantly more (Avg tenure churned: 17.98 months)
* Higher monthly charges correlate with increased churn probability

---

## Business Recommendations

* Incentivize migration from month-to-month to long-term contracts
* Introduce retention offers for high-risk payment segments
* Focus onboarding and engagement strategies on new customers (0–12 months tenure)
* Develop targeted pricing or bundled service strategies

---

## Project Structure

```
📁 data/
   └── telco_churn_cleaned.csv

📁 python/
   └── churn_cleaning_notebook.ipynb

📁 sql/
   └── churn_analysis.sql

📁 tableau/
   ├── Telco_Churn_Dashboard.twbx
   └── dashboard_preview.png
```

---

## Skills Demonstrated

* Data Cleaning & Validation
* SQL Aggregation & Business Query Writing
* KPI Design & Dashboard Structuring
* Data Storytelling
* End-to-End Analytics Workflow Execution

---

## Author

Himanshu
Aspiring Data Analyst | SQL | Python | Tableau
End-to-End Analytics Project Development
