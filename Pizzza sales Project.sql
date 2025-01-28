Select * 
from pizzahut.Orders;

create Table Order1(
Order_id Int not null,
Order_date Date not null,
Order_time Time not null,
Primary key (Order_id));

Select *
from pizzahut.Order1;

select * 
from pizzahut_orders;

 -- Retrive the total number of order -- 
Select count(order_id) As Total_Orders
from Pizzahut.orders;

-- Calculate the total revenue generated from pizza sales.-- 
Select sum(price)
from Pizzahut.pizzas;

SELECT 
    ROUND(SUM(order_details.Quantity * pizzas.Price),
            2) AS Total_revenue
FROM
    order_details
        JOIN
    pizzas ON pizzas.pizza_id = order_details.pizza_id;

-- Identify the highest-priced pizza-- 
Select pizzas.price ,pizza_types.name 
From pizzas join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id  
order by price Desc
limit 1;

-- Identify the most common pizza size ordered-- 

SELECT Pizzas.size, count(order_details.quantity) AS Order_Count
FROM pizzahut.pizzas join 
pizzahut.order_details
on pizzahut.pizzas.pizza_id = pizzahut.order_details.pizza_id 
Group by Pizzas.size 
Order By Order_Count Desc
limit 1 ;

-- List the top 5 most ordered pizza types along with their quantities.-- 
Select 
pizza_types.name , sum(order_details.quantity ) AS Quantity
From order_details join pizzas 
on order_details.pizza_id = pizzas.pizza_id 
Join  pizza_types 
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
Group By pizza_types.name 
Order By Quantity Desc
Limit 5; 


-- Join the necessary tables to find the total quantity of each pizza category ordered.--

Select 
pizza_types.name, pizza_types.category, sum(order_details.quantity) AS Quantity
From pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id 
join order_details 
on order_details.pizza_id = pizzas.pizza_id
Group by pizza_types.category
Order by Quantity DESC ;

-- Determine the distribution of orders by hour of the day.

Select hour(Order_time) As Hours,
       Count(Order_id) As Order_count
From orders
group by hour(Order_time);


-- Join relevant tables to find the category-wise distribution of pizzas.-- 

Select 
	pizza_types.category,
    count(name) From pizza_types 
Group by category ;

-- Group the orders by date and calculate the average number of pizzas ordered per day.-- 
    Select avg(quantity) from
    (Select orders.order_date ,sum(order_details.quantity) As quantity 
    From orders join order_details 
    on orders.order_id =order_details.order_id
    Group By orders.order_date ) as Order_qunatity;



-- Determine the top 3 most ordered pizza types based on revenue.-- 
    Select 
		pizza_types.name,
        sum(order_details.quantity * pizzas.price) As Revenue 
    From 
	pizzas join pizza_types 
    on pizzas.pizza_type_id = pizza_types.pizza_type_id 
    join order_details 
    on order_details.pizza_id = pizzas.pizza_id
    Group by pizza_types.name
    order by revenue Desc
    limit 3;
    
-- Calculate the percentage contribution of each pizza type to total revenue.--  

        













