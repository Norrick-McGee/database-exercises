USE employees;
DESCRIBE employees;
#Primary Key: emp_no

SELECT emp_no,first_name,last_name FROM employees
WHERE 
first_name IN ("Irena", "Vidya", "Maya")
ORDER BY 
first_name
AND
last_name;

SELECT emp_no, first_name, last_name FROM employees
WHERE
	last_name LIKE "E%"
ORDER BY
emp_no;

SELECT emp_no, first_name, last_name, hire_date FROM employees
WHERE 
	hire_date BETWEEN 
		'1990-01-01' 
        AND 
        '1999-12-31';

SELECT emp_no, first_name, last_name, birth_date FROM employees
WHERE 
	birth_date LIKE "%-12-25";

SELECT emp_no, first_name, last_name FROM employees
WHERE 
	last_name LIKE '%q%';
