# Basic:
# Retrieve the total number of orders placed.


SELECT 
    COUNT(order_id) AS Total_Orders
FROM
    orders;



# Calculate the total revenue generated from pizza sales.

SELECT 
    ROUND(SUM(orders_details.quantity * pizzas.price),
            2) AS Total_Revenue
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id;


#Identify the highest-priced pizza.


SELECT 
    pizza_types.name, pizzas.price
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1
;

# Identify the most common pizza size ordered.

SELECT 
    pizzas.size, COUNT(orders_details.quantity)
FROM
    orders_details
        JOIN
    pizzas ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizzas.size
ORDER BY pizzas.size
;


# List the top 5 most ordered pizza types along with their quantities.

SELECT 
    pizza_types.name,
    COUNT(orders_details.quantity) AS Total_Order_Times
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizza_types.name
ORDER BY COUNT(orders_details.quantity) DESC
;

























