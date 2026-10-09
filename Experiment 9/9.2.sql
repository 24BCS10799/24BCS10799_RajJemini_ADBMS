CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    per_hour_salary NUMERIC(10,2),
    working_hours NUMERIC(10,2),
    payable_amount NUMERIC(12,2)
);
CREATE OR REPLACE FUNCTION Exec_Salary()
RETURNS TRIGGER 
LANGUAGE plpgsql
AS $$
   BEGIN
     NEW.payable_amount:=NEW.per_hour_salary*NEW.working_hours;
	 IF NEW.payable_amount>25000 THEN
	 RAISE NOTICE 'AMOUNT GREATER THAN 25000 NOT ALLOWED';
	 END IF;
	 RETURN NEW;
   END;
$$

CREATE TRIGGER trig_exec_salary
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION Exec_Salary();

CREATE OR REPLACE FUNCTION employee_log()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
   BEGIN
     RAISE NOTICE 'ROWS UPDATED SUCCESSFULLY';
	 RETURN NULL;
END;
$$

CREATE TRIGGER trig_employee_log
AFTER INSERT OR UPDATE ON employee
FOR EACH STATEMENT 
EXECUTE FUNCTION employee_log();

INSERT INTO employee
(emp_id, emp_name, per_hour_salary, working_hours)
VALUES
(1, 'Raj', 500, 40);

SELECT * FROM employee;

INSERT INTO employee
(emp_id,emp_name,per_hour_salary,working_hours)
VALUES
(2,'JEMINI',500,60);

DELETE FROM employee WHERE emp_id=2;
