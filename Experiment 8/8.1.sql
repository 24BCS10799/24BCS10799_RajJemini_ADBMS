CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary NUMERIC(10,2)
);
INSERT INTO employees (emp_id, emp_name, salary)
VALUES
(101, 'Amit Sharma', 30000),
(102, 'Rahul Verma', 40000),
(103, 'Priya Singh', 50000),
(104, 'Neha Kapoor', 35000);

CREATE OR REPLACE PROCEDURE update_salary_proc(
IN p_emp_id INT,
OUT p_status VARCHAR(20),
INOUT p_salary NUMERIC
)
AS $$
DECLARE 
 curr_salary NUMERIC(10,2);
 BEGIN
   SELECT salary INTO curr_salary FROM employees
   WHERE emp_id=p_emp_id;
   IF NOT FOUND THEN
   RAISE NOTICE 'Employee not Found';
   END IF;
   p_salary:=curr_salary+p_salary;
   UPDATE employees
   SET salary=p_salary
   WHERE emp_id=p_emp_id;
   p_status='SUCCESS';
 END;
 $$ LANGUAGE PLPGSQL

CALL update_salary_proc(103,NULL,5200);
SELECT * FROM employees;
