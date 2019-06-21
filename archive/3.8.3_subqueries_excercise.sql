SELECT 
    *
FROM
    employees
WHERE
    hire_date IN (SELECT 
            hire_date
        FROM
            employees
        WHERE
            emp_no = 101010);
            
SELECT 
    title
FROM
    titles
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees
        WHERE
            first_name = 'Aamod');
            
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            current_dept_emp
        WHERE
            to_date > NOW());
            
            
            
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            to_date > NOW())
        AND gender = 'f';
        
SELECT 
    employees.first_name, employees.last_name, salaries.salary
FROM
    employees
        JOIN
    salaries ON salaries.emp_no = employees.emp_no
WHERE
    employees.emp_no IN (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            salary > (SELECT 
                    AVG(salary)
                FROM
                    salaries));
            
	
SELECT 
    COUNT(*)
FROM
    employees
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            SALARY > (SELECT 
                    MAX(salary) - STDDEV(salary)
                FROM
                    salaries)
                AND to_date > NOW())
                ;
                
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IN (SELECT 
            dept_no
        FROM
            dept_manager
        WHERE
            emp_no IN (SELECT 
                    emp_no
                FROM
                    employees
                WHERE
                    gender = 'f')
                AND to_date > NOW());
                
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            salary = (SELECT 
                    MAX(salary)
                FROM
                    salaries));
                    
                    
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IN (SELECT 
            dept_no
        FROM
            current_dept_emp
        WHERE
            emp_no IN (SELECT 
                    emp_no
                FROM
                    salaries
                WHERE
                    salary = (SELECT 
                            MAX(salary)
                        FROM
                            salaries)));