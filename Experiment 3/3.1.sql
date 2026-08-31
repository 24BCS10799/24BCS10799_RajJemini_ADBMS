-- Write your PostgreSQL query statement below
select name as CUSTOMERS 
from Customers where id not in (
    select CustomerId from orders
);
