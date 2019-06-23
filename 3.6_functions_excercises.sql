USE employees;

SELECT * FROM employees WHERE first_name IN('Irena','Vidya','Maya') 
ORDER BY last_name DESC, first_name DESC;
    
SELECT * FROM employees WHERE last_name LIKE 'e%'
ORDER BY emp_no DESC;

SELECT * FROM employees WHERE hire_date LIKE '199%';

SELECT * FROM employees WHERE birth_date LIKE '%-12-25';
SELECT * FROM employees WHERE last_name LIKE '%q%';

SELECT * FROM employees 
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

SELECT * FROM employees 
WHERE ((first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya') 
AND gender = 'M');

SELECT * FROM employees
WHERE (last_name LIKE 'e%' OR last_name LIKE '%e');

SELECT UPPER(CONCAT(first_name,' ', last_name)) as full_name FROM employees
WHERE (last_name LIKE 'e%' AND last_name LIKE '%e');

SELECT first_name, last_name, DATEDIFF(NOW(),hire_date) AS days_with_comp, hire_date  FROM employees
WHERE  birth_date LIKE '%-12-25' AND hire_date BETWEEN '1990-01-01' AND '2000-01-01'
ORDER BY birth_date, hire_date DESC;

SELECT * FROM employees
WHERE (last_name LIKE '%q%' AND last_name NOT LIKE '%qu%');

SELECT MAX(salary), MIN(salary) FROM salaries;

SELECT 
CONCAT(
	LOWER(SUBSTR(first_name,1,1)),
	LOWER(SUBSTR(last_name,1,4)),
	'_',
	SUBSTR(birth_date,6,2),
	SUBSTR(birth_date,3,2)
	) AS username,
first_name,
last_name,
birth_date        
FROM employees;