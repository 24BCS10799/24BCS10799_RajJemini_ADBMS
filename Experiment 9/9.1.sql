CREATE OR REPLACE TRIGGER check_salary_hike
BEFORE UPDATE ON Salary_Hike
FOR EACH ROW
DECLARE
    salary_limit EXCEPTION;
BEGIN
    IF :NEW.salary > :OLD.salary * 1.15 THEN
        RAISE salary_limit;
    END IF;

EXCEPTION
    WHEN salary_limit THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary hike cannot exceed 15%');
END;
