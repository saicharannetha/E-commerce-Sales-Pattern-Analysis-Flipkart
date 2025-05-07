
CREATE TABLE flipkart_sales (
    order_id VARCHAR(20) PRIMARY KEY,
    product_category VARCHAR(100),
    sales_amount DECIMAL(10, 2),
    quantity_sold INT,
    order_date DATE,
    region VARCHAR(50),
    customer_rating DECIMAL(2,1),
    payment_method VARCHAR(50),
    discount_percent DECIMAL(4,2)
);

INSERT INTO flipkart_sales VALUES ('ORD_1', 'Home Decor', 16295.0, 2, '2023-01-01', 'East', 1.5, 'UPI', 10.0);
INSERT INTO flipkart_sales VALUES ('ORD_2', 'Beauty & Health', 1360.0, 5, '2023-01-01', 'West', 3.1, 'Credit Card', 15.0);
INSERT INTO flipkart_sales VALUES ('ORD_3', 'Electronics', 5890.0, 1, '2023-01-02', 'Central', 1.5, 'Net_Banking', 5.0);
INSERT INTO flipkart_sales VALUES ('ORD_4', 'Home Decor', 12464.0, 7, '2023-01-02', 'South', 2.1, 'UPI', 5.0);
INSERT INTO flipkart_sales VALUES ('ORD_5', 'Grocery', 11784.0, 1, '2023-01-03', 'South', 1.2, 'COD', 10.0);
INSERT INTO flipkart_sales VALUES ('ORD_6', 'Electronics', 6765.0, 4, '2023-01-03', 'Central', 3.8, 'Net Banking', 15.0);
INSERT INTO flipkart_sales VALUES ('ORD_7', 'Toys & Baby', 17350.0, 9, '2023-01-04', 'South', 2.8, 'Credit Card', 15.0);
INSERT INTO flipkart_sales VALUES ('ORD_8', 'Toys & Baby', 4926.0, 1, '2023-01-04', 'East', 4.6, 'COD', 5.0);
INSERT INTO flipkart_sales VALUES ('ORD_9', 'Fashion', 14923.0, 4, '2023-01-05', 'Central', 3.8, 'Net Banking', 5.0);
INSERT INTO flipkart_sales VALUES ('ORD_10', 'Beauty & Health', 11863.0, 6, '2023-01-05', 'South', 2.0, 'Net Banking', 25.0);


-- 1. Total sales by category and region
SELECT product_category, region, SUM(sales_amount) AS total_sales
FROM flipkart_sales
GROUP BY product_category, region;

-- 2. Monthly sales trend
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(sales_amount) AS monthly_sales
FROM flipkart_sales
GROUP BY month
ORDER BY month;

-- 3. Average customer rating by product category
SELECT product_category, AVG(customer_rating) AS avg_rating
FROM flipkart_sales
GROUP BY product_category;

-- 4. Most used payment methods
SELECT payment_method, COUNT(*) AS usage_count
FROM flipkart_sales
GROUP BY payment_method
ORDER BY usage_count DESC;

-- 5. Sales amount after discount
SELECT order_id, sales_amount, discount_percent,
       (sales_amount * (1 - discount_percent / 100)) AS discounted_sales
FROM flipkart_sales;

-- 6. High-value orders
SELECT * FROM flipkart_sales
WHERE sales_amount > 10000;

-- 7. Customer segmentation based on rating
SELECT *,
       CASE
           WHEN customer_rating >= 4 THEN 'High'
           WHEN customer_rating >= 2 THEN 'Medium'
           ELSE 'Low'
       END AS rating_segment
FROM flipkart_sales;
