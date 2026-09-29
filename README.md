# Automated Retail Sales Analytics System

## Project Overview

The Automated Retail Sales Analytics System is an end-to-end data analytics project designed to transform raw retail sales data into validated, analyzed, and visualized business information.

The project demonstrates the use of Python, SQL Server, Excel, and Power BI to build a data workflow that includes data cleaning, validation, ETL processing, database storage, SQL analysis, statistical analysis, and interactive dashboard reporting.

The system begins with raw sales data, processes the data through a Python ETL pipeline, stores validated records in SQL Server, performs analytical queries, and presents key business insights through Power BI.

## Project Workflow

Raw Sales Data  
↓  
Python Data Extraction  
↓  
Data Cleaning and Standardization  
↓  
Data Quality Validation  
↓  
ETL Processing  
↓  
SQL Server Database  
↓  
SQL Analysis and Reporting Views  
↓  
Python Exploratory Analysis  
↓  
Correlation Analysis  
↓  
Regression Analysis  
↓  
Power BI Dashboard  
↓  
Business Insights and Reporting


## Business Problem

Retail businesses generate sales data from daily transactions, but raw sales data may contain missing values, inconsistent entries, incorrect calculations, and formatting issues.

Without proper data cleaning and analysis, it becomes difficult to determine sales performance, identify important products and categories, compare locations, understand payment patterns, and support data-driven business decisions.

This project addresses these challenges by developing a structured analytics workflow that cleans and validates the raw data, stores reliable records in SQL Server, performs statistical and business analysis, and presents the results through an interactive Power BI dashboard.


## Project Objectives

The main objectives of this project are to:

- Clean and standardize raw retail sales data using Python.
- Identify and isolate records requiring data quality review.
- Build an automated ETL pipeline for repeatable data processing.
- Store validated sales records in a SQL Server database.
- Develop SQL reporting views for business analysis.
- Perform exploratory data analysis using Python.
- Analyze relationships between key numerical variables using correlation analysis.
- Build and evaluate a simple linear regression model.
- Develop an interactive Power BI dashboard for sales reporting.
- Generate business insights from sales performance data.
- Demonstrate an end-to-end data analytics workflow suitable for real-world business applications.

## Tools and Technologies

| Tool | Purpose |
|---|---|
| Excel | Initial data entry and raw data preparation |
| Python | Data cleaning, transformation, ETL, exploratory analysis, correlation, and regression |
| Pandas | Data manipulation and analysis |
| Jupyter Notebook | Python development, analysis, and project documentation |
| SQL Server | Central database storage and SQL analysis |
| SQL | Data querying, aggregation, validation, and reporting views |
| Power BI | Interactive dashboard development and business reporting |
| GitHub | Project version control and portfolio presentation |


## Dataset Description

The project started with a raw retail sales dataset containing 50 transaction records.

The dataset contains the following fields:

- Transaction ID
- Customer ID
- Category
- Item
- Price Per Unit
- Quantity
- Total Spent
- Payment Method
- Location
- Transaction Date

The raw dataset intentionally contains data quality issues such as missing values, inconsistent text formats, incorrect total values, an invalid quantity, and inconsistent payment method and location entries.

After the Python ETL and validation process:

- 41 records passed the quality checks.
- 9 records were separated for review.
- 41 validated records were loaded into SQL Server.
- The validated dataset contains 20 unique products and 22 unique customers.

## Data Quality Assessment

The raw dataset was inspected before loading it into the database.

The assessment identified the following issues:

- Missing Customer IDs
- Missing Price Per Unit values
- Missing Quantity values
- Missing Total Spent values
- Missing Location values
- Inconsistent payment method formats
- Inconsistent location capitalization
- An invalid negative quantity
- Incorrect Total Spent values
- Mixed date formats

Instead of deleting questionable records without review, the ETL process separated them into two groups:

**Validated records:** 41

**Records requiring review:** 9

Only validated records were loaded into the `sales_etl` table in SQL Server.

This approach preserves data quality while maintaining an audit trail for records that require further investigation.

## Data Cleaning and Transformation

Python was used to clean and standardize the raw sales data before database loading.

The cleaning process included:

- Removing completely empty columns.
- Standardizing column names.
- Removing unnecessary whitespace from text fields.
- Standardizing payment method values.
- Standardizing location names.
- Converting numerical fields to appropriate numeric data types.
- Converting transaction dates to a consistent date format.
- Calculating expected transaction totals using Price Per Unit × Quantity.
- Comparing calculated totals with the reported Total Spent values.
- Identifying missing and invalid records.
- Separating valid records from records requiring review.
- Preserving the original reported transaction total for audit purposes.

The cleaned dataset was then prepared for loading into SQL Server.

## ETL Pipeline

The project uses an automated Extract, Transform, Load (ETL) process implemented in Python.

### Extract

The raw sales CSV file is loaded into Python using Pandas.

### Transform

The data is cleaned, standardized, validated, and transformed.

The transformation process includes:

- Text standardization
- Numeric conversion
- Date conversion
- Missing-value detection
- Quantity validation
- Transaction-total validation
- Separation of valid records and records requiring review
- Preservation of original reported values

### Load

Validated records are loaded into the SQL Server `sales_etl` table.

The ETL process also prevents duplicate transaction records from being loaded when the process is run again.

### ETL Results

| Stage | Records |
|---|---:|
| Raw records | 50 |
| Validated records | 41 |
| Records requiring review | 9 |
| Records loaded into SQL Server | 41 |

This makes the ETL process repeatable and suitable for future updates to the sales dataset.

## SQL Server Database

The validated sales data is stored in a Microsoft SQL Server database named `Precious_Sales_Analysis`.

The main table used for the validated dataset is:

`dbo.sales_etl`

The table contains:

- Transaction ID
- Customer ID
- Category
- Item
- Price Per Unit
- Quantity
- Total Spent
- Original Total Spent
- Payment Method
- Location
- Transaction Date

Five SQL reporting views were created to support analysis:

1. `vw_sales_by_category`
2. `vw_monthly_sales`
3. `vw_product_performance`
4. `vw_sales_by_location`
5. `vw_sales_by_payment_method`

These views provide reusable summaries for reporting and Power BI visualization.

## SQL Analysis

SQL Server was used to perform structured analysis on the validated sales data.

The analysis included:

- Total transaction count
- Total units sold
- Total revenue
- Average transaction value
- Revenue by category
- Revenue by location
- Revenue by payment method
- Monthly revenue
- Product performance
- Customer and product counts

The validated dataset produced the following overall metrics:

| KPI | Value |
|---|---:|
| Total Transactions | 41 |
| Total Units Sold | 95 |
| Total Revenue | ₦698,500 |
| Average Transaction Value | ₦17,036.59 |
| Unique Customers | 22 |
| Unique Products | 20 |

## Exploratory Data Analysis

Python was used to explore the validated sales data and identify patterns across different dimensions.

The analysis examined:

- Sales performance by category
- Sales performance by location
- Monthly revenue trends
- Product-level performance
- Payment method distribution
- Transaction values
- Quantity sold
- Price per unit

The analysis showed that Food generated the highest category revenue at ₦287,500.

Among the recorded locations, Lagos generated ₦235,000 in revenue, followed by Uyo with ₦200,500.

The monthly analysis showed that March recorded the highest revenue among the available transaction months, with ₦184,500.

These results were used to support the business insights presented in the final dashboard.

## Correlation Analysis

Correlation analysis was performed in Python to examine the linear relationships between selected numerical variables.

The variables analyzed included:

- Price Per Unit
- Quantity
- Total Spent

The analysis showed the following correlation coefficients:

| Variables | Correlation |
|---|---:|
| Price Per Unit and Quantity | -0.447 |
| Price Per Unit and Total Spent | 0.472 |
| Quantity and Total Spent | 0.441 |

The negative correlation between Price Per Unit and Quantity indicates that, within this dataset, higher unit prices were generally associated with lower quantities.

The positive correlations between Price Per Unit, Quantity, and Total Spent indicate that increases in these variables tend to be associated with increases in transaction value.

Correlation measures association and does not establish causation.

It is also important to note that Total Spent is calculated from Price Per Unit and Quantity, so correlations involving Total Spent are partly influenced by this mathematical relationship.

## Regression Analysis

A simple linear regression model was developed in Python to examine whether Price Per Unit could be used to predict Quantity Sold.

### Model

- Predictor: Price Per Unit
- Target: Quantity
- Training records: 32
- Testing records: 9
- Total records used: 41

### Model Performance

| Metric | Result |
|---|---:|
| Mean Absolute Error (MAE) | 0.842 |
| R² Score | 0.383 |

The model's R² score indicates that approximately 38.3% of the variation in Quantity Sold was explained by Price Per Unit in this sample.

The MAE of approximately 0.84 means that the model's predictions differed from the actual quantity by about 0.84 units on average in the test set.

The model is presented as an analytical exercise based on the available dataset and should not be interpreted as a complete demand forecasting system. Additional variables and a larger dataset would be required for a more comprehensive predictive model.


## Power BI Dashboard

Power BI was used to create an interactive dashboard for monitoring retail sales performance.

### Dashboard KPIs

The dashboard displays:

- Total Revenue: ₦698,500
- Total Transactions: 41
- Total Units Sold: 95
- Average Transaction Value: ₦17,037

### Dashboard Visualizations

The dashboard includes:

- Revenue by Category
- Monthly Revenue Trend
- Top 10 Products by Revenue
- Revenue by Location
- Revenue by Payment Method

Interactive slicers allow users to filter the dashboard by:

- Location
- Payment Method

The dashboard connects to the validated SQL Server data, allowing the visualizations and KPIs to respond dynamically to user selections.


## Key Findings

The analysis of the validated sales records produced the following findings:

- Total validated revenue was ₦698,500 from 41 transactions.
- A total of 95 units were sold.
- Food generated the highest category revenue at ₦287,500.
- Lagos recorded ₦235,000 in revenue among the recorded locations.
- Uyo recorded ₦200,500 in revenue.
- March recorded the highest monthly revenue among the available transaction months, at ₦184,500.
- The dashboard provides interactive analysis by location and payment method.
- The regression analysis found a moderate relationship between Price Per Unit and Quantity in this dataset, with an R² of 0.383.


## Business Recommendations

Based on the analysis, the following areas could be considered by the business:

- Monitor the performance of high-revenue product categories and individual products.
- Investigate the factors contributing to differences in sales across locations.
- Review products with low sales volumes to determine whether pricing, demand, or product availability may be affecting performance.
- Continue collecting consistent and complete customer, location, payment, and transaction data.
- Use the Power BI dashboard for regular monitoring of sales performance.
- Expand the dataset over time to support more reliable trend analysis and predictive modelling.
- Investigate records placed in the ETL review queue before including them in future analysis.

## Project Limitations

The project has several limitations that should be considered when interpreting the results:

- The dataset contains only 50 raw records, with 41 records passing the validation process.
- The available transaction period contains gaps between some months.
- Some customer and location information is missing.
- The regression model uses only Price Per Unit as the predictor of Quantity.
- The dataset does not contain additional variables such as discounts, profit margins, customer demographics, inventory levels, or marketing activities.
- The available data is not sufficient to establish causal relationships between variables.
- The results should therefore be interpreted as analysis of the available sample rather than a complete representation of long-term retail performance.


## Conclusion

The Automated Retail Sales Analytics System demonstrates an end-to-end approach to transforming raw retail transaction data into reliable business insights.

The project combines Python-based data cleaning and ETL, SQL Server database management and analysis, statistical analysis, and Power BI visualization.

The workflow provides a repeatable process for handling data quality issues, storing validated information, analyzing sales performance, and communicating results through an interactive dashboard.

The project also demonstrates how multiple data analytics tools can work together as part of a practical business intelligence workflow.


## Project Structure

```text
Automated_Retail_Sales_Analytics/
│
├── data/
│   ├── dirty_retail_sales_50_rows.csv
│   ├── Sales_ETL_Cleaned.csv
│   └── Sales_ETL_Review.csv
│
├── notebooks/
│   └── Automated_Retail_Sales_Analytics.ipynb
│
├── sql/
│   └── Automated_Retail_Sales_Analytics.sql
│
├── powerbi/
│   └── Automated_Retail_Sales_Analytics.pbix
│
├── reports/
│   ├── Sales_KPI_Report.csv
│   ├── Regression_Summary.csv
│   └── Model_Comparison.csv
│
└── README.md


## Skills Demonstrated

This project demonstrates practical skills in:

- Data cleaning and preprocessing
- Data quality assessment
- Python programming
- Pandas data analysis
- ETL pipeline development
- SQL Server database management
- SQL querying and aggregation
- Database validation
- Exploratory Data Analysis
- Correlation analysis
- Linear regression
- Data visualization
- Power BI dashboard development
- Business intelligence reporting
- Data-driven business analysis

## Project Status

**Completed**

The project includes:

- Python data cleaning and ETL pipeline
- SQL Server database
- SQL reporting views
- Exploratory data analysis
- Correlation analysis
- Regression analysis
- Power BI interactive dashboard
- Project documentation

## Author

**Precious Etukudo**

Data Analyst | Front End Web Developer

This project was developed as a practical demonstration of data analytics, database management, statistical analysis, ETL, and business intelligence skills.