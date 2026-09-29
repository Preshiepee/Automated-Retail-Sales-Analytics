USE Precious_Sales_Analysis;
GO

-- ============================================
-- AUTOMATED RETAIL SALES ANALYTICS SYSTEM
-- SQL SERVER PROJECT SCRIPT
-- ============================================

-- ============================================
-- 1. VALIDATED SALES TABLE
-- ============================================

IF OBJECT_ID('dbo.sales_etl', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.sales_etl (
        transaction_id VARCHAR(20) PRIMARY KEY,
        customer_id VARCHAR(20),
        category VARCHAR(100),
        item VARCHAR(100),
        price_per_unit DECIMAL(12,2),
        quantity INT,
        total_spent DECIMAL(12,2),
        original_total_spent DECIMAL(12,2),
        payment_method VARCHAR(50),
        location VARCHAR(100),
        transaction_date DATE
    );
END;
GO

-- ============================================
-- 2. REVENUE BY CATEGORY
-- ============================================

DROP VIEW IF EXISTS dbo.vw_sales_by_category;
GO

CREATE VIEW dbo.vw_sales_by_category
AS
SELECT
    category,
    COUNT(*) AS transaction_count,
    SUM(quantity) AS units_sold,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS average_transaction_value
FROM dbo.sales_etl
GROUP BY category;
GO


-- ============================================
-- 3. MONTHLY SALES
-- ============================================

DROP VIEW IF EXISTS dbo.vw_monthly_sales;
GO

CREATE VIEW dbo.vw_monthly_sales
AS
SELECT
    YEAR(transaction_date) AS sales_year,
    MONTH(transaction_date) AS sales_month,
    COUNT(*) AS transaction_count,
    SUM(quantity) AS units_sold,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS average_transaction_value
FROM dbo.sales_etl
GROUP BY
    YEAR(transaction_date),
    MONTH(transaction_date);
GO


-- ============================================
-- 4. PRODUCT PERFORMANCE
-- ============================================

DROP VIEW IF EXISTS dbo.vw_product_performance;
GO

CREATE VIEW dbo.vw_product_performance
AS
SELECT
    item,
    category,
    SUM(quantity) AS units_sold,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS average_transaction_value
FROM dbo.sales_etl
GROUP BY
    item,
    category;
GO

-- ============================================
-- 5. SALES BY LOCATION
-- ============================================

DROP VIEW IF EXISTS dbo.vw_sales_by_location;
GO

CREATE VIEW dbo.vw_sales_by_location
AS
SELECT
    location,
    COUNT(*) AS transaction_count,
    SUM(quantity) AS units_sold,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS average_transaction_value
FROM dbo.sales_etl
GROUP BY location;
GO

-- ============================================
-- 6. SALES BY PAYMENT METHOD
-- ============================================

DROP VIEW IF EXISTS dbo.vw_sales_by_payment_method;
GO

CREATE VIEW dbo.vw_sales_by_payment_method
AS
SELECT
    payment_method,
    COUNT(*) AS transaction_count,
    SUM(quantity) AS units_sold,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS average_transaction_value
FROM dbo.sales_etl
GROUP BY payment_method;
GO

-- ============================================
-- 7. KEY PERFORMANCE INDICATORS
-- ============================================

SELECT
    COUNT(*) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    SUM(total_spent) AS total_revenue,
    AVG(total_spent) AS average_transaction_value,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT item) AS unique_products
FROM dbo.sales_etl;
GO

-- ============================================
-- 8. DATABASE VALIDATION
-- ============================================

SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT transaction_id) AS unique_transaction_ids,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(DISTINCT item) AS unique_products,
    COUNT(DISTINCT location) AS unique_locations,
    SUM(CASE WHEN quantity <= 0 THEN 1 ELSE 0 END) AS invalid_quantities,
    SUM(CASE WHEN transaction_id IS NULL THEN 1 ELSE 0 END) AS missing_transaction_ids
FROM dbo.sales_etl;
GO

