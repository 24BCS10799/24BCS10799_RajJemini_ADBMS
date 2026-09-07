DROP TABLE employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    emp_salary DECIMAL(10, 2) NOT NULL,
      emp_city VARCHAR(100) NOT NULL
);

INSERT INTO employees (emp_id, emp_name, emp_salary, emp_city) VALUES
(101, 'Amit Sharma', 85000.00, 'Mumbai'),
(102, 'Priya Patel', 95000.00, 'Mumbai'),
(103, 'Rahul Verma', 60000.00, 'Delhi'),
(104, 'Ananya Iyer', 110000.00, 'Bangalore'),
(105, 'Vikram Singh', 55000.00, 'Delhi'),
(106, 'Sneha Reddy', 105000.00, 'Bangalore'),
(107, 'Rohan Das', 72000.00, 'Kolkata')
SELECT * FROM employees;
CREATE VIEW EMP_VIEW AS 
SELECT emp_id,emp_name FROM EMPLOYEES

SELECT * FROM EMP_VIEW;
DELETE FROM EMP_VIEW WHERE emp_id=101; --ALSO DELETES FROM THE MAIN TABLE-- 

CREATE MATERIALIZED VIEW EMP_MATERIAL_VIEW AS 
SELECT emp_id,emp_name FROM employees 
WITH NO DATA;                         --DOES NOT POPULATE DATA INTO MATRIALIZED VIEW--

SELECT * FROM EMP_MATERIAL_VIEW;

REFRESH MATERIALIZED VIEW EMP_MATERIAL_VIEW;
