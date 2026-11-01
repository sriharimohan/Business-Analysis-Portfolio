-- ====================================================================
-- Project: Omnichannel Retail Operations & Checkout Conversion
-- Script Name: schema_and_seed_data.sql
-- Description: Sets up relational database tables and sample records 
--              for customers, products, and sales transactions.
-- ====================================================================

-- 1. Create Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    signup_date DATE
);

-- 2. Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_name VARCHAR(50)
);

-- 3. Create Sales / Orders Transactions Table
CREATE TABLE sales_transactions (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    transaction_date DATE,
    status_code VARCHAR(20),
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Sample Data
INSERT INTO customers VALUES (1, 'Alice Smith', '2025-01-10');
INSERT INTO customers VALUES (2, 'Bob Jones', '2025-02-15');

INSERT INTO products VALUES (101, 'Wireless Mouse', 'Electronics');
INSERT INTO products VALUES (102, 'Organic Coffee Beans', 'Grocery');

INSERT INTO sales_transactions VALUES (1001, 1, 101, 2, 25.00, '2026-10-15', 'COMPLETED', 50.00);
INSERT INTO sales_transactions VALUES (1002, NULL, 102, 1, 15.00, '2026-10-16', 'TIMEOUT', 15.00);