-- 1.Employee and Manager Names: Display a list of employee names along with their manager's names. Use the 'employees' table provided.
select e1.employee_name as Employee, e2.employee_name as Manager from employees as e1 left join employees as e2 on e1.manager_id=e2.employee_id; 
-- 2.Every Possible Combination: Show every possible combination of 'customer_name' from the 'customers' table and 'product_name' from the 'products' table.
select c.customer_name , p.product_name from customers as c cross join products as p ;
