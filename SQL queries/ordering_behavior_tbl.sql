create table ordering_tbl(
order_id int  primary key,
user_id  varchar(50), age int, city varchar(50), order_time varchar(50), day_type varchar(50),
       cuisine varchar(50), meal_type varchar(50), restaurant_type varchar(50), order_value float,
       discount_applied varchar(50), delivery_fee float, time_taken_to_order int,
       rating_given float, is_repeat_order varchar(50), mood varchar(50), hunger_level varchar(50), company varchar(50),
       rainy_weather varchar(50)
)
 select * from ordering_tbl

 -- Peak Ordering Time
SELECT order_time, COUNT(*) AS total_orders
FROM ordering_tbl
GROUP BY order_time
ORDER BY total_orders DESC;

-- Revenue by City
SELECT city, SUM(order_value) AS total_revenue
FROM ordering_tbl
GROUP BY city
ORDER BY total_revenue DESC;

-- Average Order Value by Time
SELECT order_time, AVG(order_value) AS avg_order_value
FROM ordering_tbl
GROUP BY order_time;

-- Discount Impact
SELECT discount_applied, 
       AVG(order_value) AS avg_order_value,
       AVG(CASE WHEN is_repeat_order = 'Yes' THEN 1 ELSE 0 END) AS repeat_rate
FROM ordering_tbl
GROUP BY discount_applied;

-- Repeat vs New Customers
SELECT is_repeat_order, 
       COUNT(*) AS total_orders,
       AVG(order_value) AS avg_spending
FROM ordering_tbl
GROUP BY is_repeat_order;

-- Cuisine Popularity
SELECT cuisine, COUNT(*) AS total_orders
FROM ordering_tbl
GROUP BY cuisine
ORDER BY total_orders DESC;

-- Rain Impact
SELECT rainy_weather, COUNT(*) AS total_orders
FROM ordering_tbl
GROUP BY rainy_weather;