USE employees;

SHOW TABLES;
DESCRIBE departments;
DESCRIBE dept_manager;

-- FIND ALL DEPT MANAGERS --
SELECT 
    departments.dept_name AS Department, 
    CONCAT(employees.first_name, ' ',employees.last_name) AS Manager
FROM
    departments
        JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees ON dept_manager.emp_no = employees.emp_no
WHERE
    dept_manager.to_date > NOW();
   
   
   
-- FIND ALL FEMALE DEPARTMENT MANAGERS --
SELECT 
    departments.dept_name AS Department, 
    CONCAT(employees.first_name, ' ', employees.last_name) AS Manager
FROM
    departments
        JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees ON dept_manager.emp_no = employees.emp_no
WHERE
    dept_manager.to_date > NOW()
		AND
	employees.gender = 'f';
    
    
-- COUNT OF ALL CURRENT JOB TITLES IN CUSTOMER SERVICE --
SELECT 
    titles.title,count(*)
FROM
    titles
        JOIN
    dept_emp ON titles.emp_no = dept_emp.emp_no
        JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	dept_name = 'Customer Service'
		AND
	titles.to_date > NOW()
GROUP BY titles.title;

-- SALARIES OF ALL CURRENT MANAGERS --

SELECT 
    departments.dept_name AS Department, 
    CONCAT(employees.first_name, ' ',employees.last_name) AS Manager,
    salary
FROM
    departments
        JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees ON dept_manager.emp_no = employees.emp_no
		JOIN
	salaries ON dept_manager.emp_no = salaries.emp_no
WHERE
    dept_manager.to_date > NOW()
		and
	salaries.to_date > NOW();
    
-- Dept COUNT --

SELECT 
    departments.dept_no, departments.dept_name, COUNT(*)
FROM
    dept_emp
        JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE
    dept_emp.to_date > NOW()
GROUP BY departments.dept_no;

-- Salary Averages -- 

SELECT 
    departments.dept_name, departments.dept_no, avg(salaries.salary)
FROM
    salaries
        JOIN
    dept_emp ON salaries.emp_no = dept_emp.emp_no
        JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_emp.to_date > NOW() 
	AND 
		salaries.to_date > NOW()
GROUP BY departments.dept_no;

-- HIGHEST PAYED EMPLOYEE IN MARKETING -- 
SELECT 
    CONCAT(first_name, ' ' ,last_name) as 'highest payed in marketing'
FROM
    salaries
        JOIN
    dept_emp ON salaries.emp_no = dept_emp.emp_no
        JOIN
    departments ON dept_emp.dept_no = departments.dept_no
		JOIN 
	employees ON employees.emp_no = dept_emp.emp_no
    WHERE departments.dept_name = "Marketing" 
		AND
	dept_emp.to_date > NOW()
		AND
	salaries.to_date > NOW()
	ORDER BY salaries.salary DESC
LIMIT 1;


-- HIGHEST PAYED MANAGER -- 
SELECT 
    departments.dept_name AS Department, 
    CONCAT(employees.first_name, ' ',employees.last_name) AS Manager,
    salaries.salary
FROM
    departments
        JOIN
    dept_manager ON departments.dept_no = dept_manager.dept_no
        JOIN
    employees ON dept_manager.emp_no = employees.emp_no
		JOIN
	salaries ON employees.emp_no = salaries.emp_no
WHERE
    dept_manager.to_date > NOW()
    AND 
    salaries.to_date > NOW() 
ORDER BY salaries.salary DESC
LIMIT 1;

-- ALL CURRENT EMPS AND THEIR DEPT --
SELECT 
	*
FROM
    titles
        JOIN
    dept_emp ON titles.emp_no = dept_emp.emp_no
        JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
	titles.to_date > NOW()


    
    
    