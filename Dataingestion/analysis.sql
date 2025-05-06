with cte as (
	SELECT * FROM order_details_2023
	UNION ALL 
	SELECT * FROM order_details_2024
	UNION ALL
	SELECT * FROM order_details_2025)
SELECT COUNT(*) FROM cte;


CREATE TABLE orders AS (
 SELECT * FROM orders_2023
 UNION ALL 
 SELECT * FROM orders_2024
 UNION ALL 
 SELECT * FROM orders_2025
);

SELECT * FROM orders;


CREATE TABLE order_details AS (
 SELECT * FROM order_details_2023
 UNION ALL 
 SELECT * FROM order_details_2024
 UNION ALL 
 SELECT * FROM order_details_2025
);

SELECT * FROM order_details;




SELECT * FROM orders;

-- CHECK FOR DULICATE
SELECT COUNT(DISTINCT order_id)
from orders;


SELECT order_id, COUNT(order_id)
from orders
GROUP BY order_id
HAVING COUNT(order_id) > 1;

SELECT * FROM order_details

SELECT * FROM pizzas

SELECT * from pizza_types

-- the most ordered pizza type
SELECT pt.name,SUM(od.quantity) as total_orders 
FROM pizza_types as pt
LEFT JOIN pizzas as p
on p.pizza_type_id =pt.pizza_type_id
LEFT JOIN order_details as od
on od.pizza_id = p.pizza_id
GROUP BY pt.name
ORDER BY total_orders DESC;


SELECT SUM(quantity)
from order_details


SELECT pt.name,(p.price* od.quantity) as Revenue
FROM pizza_types as pt
LEFT JOIN pizzas as p
on p.pizza_type_id =pt.pizza_type_id
LEFT JOIN order_details as od
on od.pizza_id = p.pizza_id
GROUP BY pt.name, (p.price* od.quantity)
ORDER BY Revenue DESC;