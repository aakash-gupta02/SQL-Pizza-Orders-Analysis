# Intermediate:
# Join the necessary tables to find the total quantity of each pizza category ordered;

select * from pizzas;

SELECT 
    pizza_types.category, COUNT(orders_details.quantity)
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category;  #1






# Determine the distribution of orders by hour of the day.
 
SELECT 
    HOUR(order_time), COUNT(order_id)
FROM
    orders
GROUP BY HOUR(order_time); #0


# Join relevant tables to find the category-wise distribution of pizzas.

select category, count(name) from pizza_types group by category ; #1



# Group the orders by date and calculate the average number of pizzas ordered per day based on Order id .

SELECT 
    order_date as Date , ROUND(AVG(order_id)) as Average_Orders
FROM
    orders
GROUP BY order_date; #1




# Determine the top 3 most ordered pizza types based on revenue.

SELECT 
    pizza_types.name,
    COUNT(orders_details.quantity * pizzas.price) AS Orders,
    MAX(pizzas.price),
    SUM(orders_details.quantity * pizzas.price) AS Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name
ORDER BY Revenue DESC
LIMIT 3
;#1 

# Group the orders by date and calculate the average number of pizzas ordered per day.

SELECT 
    ROUND(AVG(Quantity))
FROM
    (SELECT 
        orders.order_date, SUM(orders_details.quantity) AS Quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity











 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 