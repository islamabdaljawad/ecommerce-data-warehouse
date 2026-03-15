/* =========================================
   1. Total Revenue
========================================= */
SELECT 
    SUM(TRY_CAST(payment_value AS FLOAT)) AS total_revenue
FROM Payments;



/* =========================================
   2. Total Number of Orders
========================================= */
SELECT 
    COUNT(*) AS total_orders
FROM Orders;



/* =========================================
   3. Revenue by Product Category
========================================= */
SELECT 
    p.product_category,
    SUM(TRY_CAST(od.price AS FLOAT)) AS total_revenue
FROM orders_details od
JOIN Products p 
    ON od.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;



/* =========================================
   4. Top 10 Best Selling Products
========================================= */
SELECT TOP 10
    od.product_id,
    COUNT(*) AS total_sales
FROM orders_details od
GROUP BY od.product_id
ORDER BY total_sales DESC;



/* =========================================
   5. Revenue by Seller
========================================= */
SELECT 
    s.seller_id,
    SUM(TRY_CAST(od.price AS FLOAT)) AS seller_revenue
FROM orders_details od
JOIN Sellers s 
    ON od.seller_id = s.seller_id
GROUP BY s.seller_id
ORDER BY seller_revenue DESC;



/* =========================================
   6. Orders by State
========================================= */
SELECT 
    u.state,
    COUNT(o.id) AS total_orders
FROM Orders o
JOIN Users u 
    ON o.user_id = u.user_id
GROUP BY u.state
ORDER BY total_orders DESC;



/* =========================================
   7. Average Order Value
========================================= */
SELECT 
    AVG(TRY_CAST(payment_value AS FLOAT)) AS avg_order_value
FROM Payments;



/* =========================================
   8. Payment Type Distribution
========================================= */
SELECT 
    payment_type,
    COUNT(*) AS total_payments
FROM Payments
GROUP BY payment_type
ORDER BY total_payments DESC;



/* =========================================
   9. Average Shipping Cost
========================================= */
SELECT 
    AVG(TRY_CAST(shipping_cost AS FLOAT)) AS avg_shipping_cost
FROM orders_details;



/* =========================================
   10. Average Delivery Time
========================================= */
SELECT 
    AVG(DATEDIFF(day,
        TRY_CAST(order_date AS DATE),
        TRY_CAST(delivered_date AS DATE)
    )) AS avg_delivery_days
FROM Orders
WHERE delivered_date IS NOT NULL;



/* =========================================
   11. Late Deliveries
========================================= */
SELECT 
    COUNT(*) AS late_deliveries
FROM Orders
WHERE TRY_CAST(delivered_date AS DATE) >
      TRY_CAST(estimated_time_delivery AS DATE);



/* =========================================
   12. Customer Order Frequency
========================================= */
SELECT 
    user_id,
    COUNT(id) AS total_orders
FROM Orders
GROUP BY user_id
ORDER BY total_orders DESC;



/* =========================================
   13. Monthly Revenue Trend
========================================= */
SELECT 
    YEAR(TRY_CAST(order_date AS DATE)) AS order_year,
    MONTH(TRY_CAST(order_date AS DATE)) AS order_month,
    SUM(TRY_CAST(p.payment_value AS FLOAT)) AS monthly_revenue
FROM Orders o
JOIN Payments p
    ON o.order_id = p.order_id
GROUP BY 
    YEAR(TRY_CAST(order_date AS DATE)),
    MONTH(TRY_CAST(order_date AS DATE))
ORDER BY order_year, order_month;



/* =========================================
   14. Top Cities by Number of Customers
========================================= */
SELECT 
    city,
    COUNT(user_id) AS total_customers
FROM Users
GROUP BY city
ORDER BY total_customers DESC;



/* =========================================
   15. Average Product Price
========================================= */
SELECT 
    AVG(TRY_CAST(price AS FLOAT)) AS avg_product_price
FROM orders_details;



/* =========================================
   16. Seller Performance by Rating
========================================= */
SELECT 
    seller_id,
    AVG(TRY_CAST(feedback_score AS FLOAT)) AS avg_rating
FROM Orders
GROUP BY seller_id
ORDER BY avg_rating DESC;