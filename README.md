# 🍕 Pizza Sales SQL Analysis

This project analyzes pizza sales data using SQL to answer key business questions and generate insights for decision-making. The dataset includes tables like `orders`, `order_details`, `pizzas`, and `pizza_types`.

---

## 📊 Table of Contents

- [Basic Queries](#basic-queries)
- [Intermediate Queries](#intermediate-queries)
- [Advanced Queries](#advanced-queries)

---

## ✅ Basic Queries

### 1. Retrieve the total number of orders placed
```sql
SELECT COUNT(order_id) AS Total_Orders
FROM orders;
````

---

### 2. Calculate the total revenue generated from pizza sales

```sql
SELECT ROUND(SUM(orders_details.quantity * pizzas.price), 2) AS Total_Revenue
FROM orders_details
JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id;
```

---

### 3. Identify the highest-priced pizza

```sql
SELECT pizza_types.name, pizzas.price
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1;
```

---

### 4. Identify the most common pizza size ordered

```sql
SELECT pizzas.size, COUNT(orders_details.quantity) AS Total_Orders
FROM orders_details
JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY pizzas.size;
```

---

### 5. List the top 5 most ordered pizza types

```sql
SELECT pizza_types.name, COUNT(orders_details.quantity) AS Total_Order_Times
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.name
ORDER BY Total_Order_Times DESC
LIMIT 5;
```

---

## 🚀 Intermediate Queries

### 1. Total quantity of each pizza category ordered

```sql
SELECT pizza_types.category, COUNT(orders_details.quantity) AS Total_Quantity
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category;
```

---

### 2. Distribution of orders by hour of the day

```sql
SELECT HOUR(order_time) AS Hour, COUNT(order_id) AS Orders
FROM orders
GROUP BY HOUR(order_time);
```

---

### 3. Category-wise distribution of pizzas

```sql
SELECT category, COUNT(name) AS Pizza_Count
FROM pizza_types
GROUP BY category;
```

---

### 4. Average number of orders per day (based on Order ID)

```sql
SELECT order_date AS Date, ROUND(AVG(order_id)) AS Average_Orders
FROM orders
GROUP BY order_date;
```

---

### 5. Top 3 most ordered pizza types based on revenue

```sql
SELECT pizza_types.name, 
       COUNT(orders_details.quantity * pizzas.price) AS Orders,
       MAX(pizzas.price) AS Max_Price,
       SUM(orders_details.quantity * pizzas.price) AS Revenue
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Revenue DESC
LIMIT 3;
```

---

### 6. Average number of pizzas ordered per day

```sql
SELECT ROUND(AVG(Quantity)) AS Avg_Pizzas_Per_Day
FROM (
    SELECT orders.order_date, SUM(orders_details.quantity) AS Quantity
    FROM orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date
) AS order_quantity;
```

---

## 🔥 Advanced Queries

### 1. Percentage contribution of each pizza type to total revenue

```sql
SELECT 
    pizza_types.category AS Type,
    ROUND(
        SUM(orders_details.quantity * pizzas.price) / 
        (SELECT SUM(orders_details.quantity * pizzas.price)
         FROM orders_details
         JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id
        ) * 100, 2
    ) AS Percent_Revenue
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY Type;
```

---

### 2. Analyze the cumulative revenue generated over time

```sql
SELECT  
    MONTH(orders.order_date) AS Month,
    ROUND(SUM(orders_details.quantity * pizzas.price), 2) AS Monthly_Revenue,
    ROUND(
        SUM(SUM(orders_details.quantity * pizzas.price)) OVER (ORDER BY MONTH(orders.order_date)),
        2
    ) AS Cumulative_Revenue
FROM orders
JOIN orders_details ON orders.order_id = orders_details.order_id
JOIN pizzas ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY MONTH(orders.order_date);
```

---

### 3. Top 3 most ordered pizza types (by revenue) for each category

```sql
SELECT 
    pizza_types.name,
    pizza_types.category,
    SUM(orders_details.quantity * pizzas.price) AS Revenue
FROM pizza_types
JOIN pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name, pizza_types.category;
-- To get Top 3 per category, use ROW_NUMBER() OVER (PARTITION BY category ORDER BY Revenue DESC)
```

---

## 📌 Dataset Used

This project uses a pizza sales dataset that includes:

* `orders`: Order metadata
* `order_details`: Quantity and pizza ID per order
* `pizzas`: Pricing and size
* `pizza_types`: Pizza names and categories

---

## 📈 Skills Practiced

* SQL Joins
* Aggregation (SUM, COUNT, AVG)
* Grouping & Filtering
* Subqueries & CTEs
* Window Functions (`OVER()`, cumulative sums)
* Revenue & performance analysis

---

## 📬 Connect

> If you like this project or have questions, feel free to open an issue or drop a message.
