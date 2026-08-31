-- Customers and Orders: List the customer_name and order_date for all customers who have placed orders.
select c.customer_name , o.order_date from customers as c inner join orders as o on c.customer_id=o.customer_id;
-- All Customers and Their Orders: List all customer names and their corresponding product_name from orders, if they have any. Include customers even if they haven't placed any orders.
select c.customer_name , o.product_name from customers as c left join orders as o on c.customer_id=o.customer_id;

-- Find Products and Their Orders: Display Product Name and the order_date from all the products that are ordered.
select p.product_name , o.order_date from products as p inner join orders as o on p.product_name=o.product_name;
