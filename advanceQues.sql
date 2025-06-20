# Advanced:
# Calculate the percentage contribution of each pizza type to total revenue.


SELECT 
    pizza_types.category AS Type,
    round(SUM(orders_details.quantity * pizzas.price)/ (SELECT 
            SUM(orders_details.quantity * pizzas.price) AS PercentRevenue
        FROM
            orders_details
                JOIN
            pizzas ON orders_details.pizza_id = pizzas.pizza_id) * 100) AS Percent_Revenue
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY Type;#1






