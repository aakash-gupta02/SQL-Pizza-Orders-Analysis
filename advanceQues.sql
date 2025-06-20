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

# Analyze the cumulative revenue generated over time.


select  month(orders.order_date) as Month , round(sum(orders_details.quantity * pizzas.price),2) as Monthly_Revenue,
  ROUND(
    SUM(SUM(orders_details.quantity * pizzas.price)) OVER (ORDER BY MONTH(orders.order_date)),
    2
  ) AS Cumulative_Revenue
from orders join orders_details
on orders.order_id = orders_details.order_id
join pizzas
on orders_details.pizza_id = pizzas.pizza_id
group by month(orders.order_date);



# Determine the top 3 most ordered pizza types based on revenue for each pizza category. 


select pizza_types.name, pizza_types.category, sum(orders_details.quantity * pizzas.price)
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name, pizza_types.category;



















