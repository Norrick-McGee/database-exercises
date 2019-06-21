USE ada_671;

CREATE TEMPORARY TABLE employees_with_departments AS 
SELECT employees.emp_no, employees.first_name, employees.last_name, dept_emp.dept_no, departments.dept_name
FROM employees.employees JOIN
employees.dept_emp USING(emp_no) JOIN
employees.departments USING(dept_no); 

DESCRIBE employees_with_departments;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);

UPDATE employees_with_departments
set full_name = CONCAT(first_name, " ", last_name);

ALTER TABLE employees_with_departments
DROP COLUMN first_name, DROP COLUMN last_name;

CREATE TEMPORARY TABLE sakila_payment 
AS SELECT payment_id, 
customer_id, 
staff_id,
rental_id, 
CAST(amount*100 AS UNSIGNED) as cents, 
payment_date, 
last_update 
FROM sakila.payment;

SELECT * from sakila_payment LIMIT 5;

CREATE TEMPORARY TABLE employee_z AS SELECT dept_emp.emp_no, dept_no, salary FROM employees.salaries JOIN employees.dept_emp USING(emp_no) 
 -- WHERE salaries.to_date > NOW()
;

SELECT * FROM employee_z;

DESCRIBE employee_z;

ALTER TABLE employee_z ADD tot_avg_sal decimal(14,4);
ALTER TABLE employee_z ADD tot_std_dev decimal(14,4);
ALTER TABLE employee_z ADD z_score decimal(14,4);

SELECT * FROM employee_z LIMIT 5;
UPDATE employee_z set tot_avg_sal = (SELECT AVG(salary) FROM employees.salaries
 -- WHERE to_date > NOW()
);
UPDATE employee_z set tot_std_dev = (SELECT STDDEV(salary) FROM employees.salaries
 -- WHERE to_date > NOW()
);
UPDATE employee_z set z_score = (salary - tot_avg_sal) / tot_std_dev;
SELECT * FROM employee_z LIMIT 5;

SELECT dept_name, avg(z_score) FROM employee_z JOIN employees.departments USING(dept_no) GROUP BY dept_name;

