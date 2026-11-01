-- ====================================================================
-- Project: Omnichannel Retail Operations & Checkout Conversion
-- Script Name: sales_aggregation.sql
-- Description: Aggregates monthly sales performance to identify top 
--              revenue-generating product categories and average order values.
-- ====================================================================

SELECT 
    p.category_name,
    COUNT(DISTINCT s.order_id) AS total_orders,
    SUM(s.quantity_sold) AS total_units_sold,
    SUM(s.quantity_sold * s.unit_price) AS total_revenue,
    ROUND(AVG(s.quantity_sold * s.unit_price), 2) AS average_order_value
FROM 
    sales_transactions s
JOIN 
    products p ON s.product_id = p.product_id
WHERE 
    s.status_code = 'COMPLETED'
GROUP BY 
    p.category_name
ORDER BY 
    total_revenue DESC;