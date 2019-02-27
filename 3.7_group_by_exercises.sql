USE employees;

SELECT DISTINCT title FROM titles;

SELECT DISTINCT last_name 
	FROM employees 
    WHERE 
		last_name LIKE "%e" 
        AND 
        last_name LIKE "e%" 
	GROUP BY last_name;
    
SELECT last_name 
	FROM employees 
    WHERE 
		last_name LIKE "%e" 
        AND 
        last_name LIKE "e%" 
	GROUP BY last_name, first_name;
    
SELECT first_name, COUNT(first_name) 
	FROM employees
	GROUP BY first_name
	ORDER BY count(first_name)
	LIMIT 1;
    
SELECT first_name, COUNT(first_name) 
	FROM employees
	GROUP BY first_name
	ORDER BY count(first_name) DESC
	LIMIT 1;

SELECT last_name, COUNT(last_name)
	FROM employees
    GROUP BY last_name
    ORDER BY count(last_name)
    LIMIT 1;
    
SELECT last_name, COUNT(last_name)
	FROM employees
    GROUP BY last_name
    ORDER BY count(last_name) DESC
    LIMIT 1;
    
SELECT first_name, last_name, COUNT(first_name)
	FROM employees
    GROUP BY first_name, last_name
    ORDER BY count(last_name)
    LIMIT 1;
    
SELECT first_name, last_name, COUNT(first_name)
	FROM employees
    GROUP BY first_name, last_name
    ORDER BY count(last_name) DESC
    LIMIT 1;
    
SELECT gender,count(gender) FROM employees WHERE first_name IN('Irena','Vidya','Maya') 
	GROUP BY gender;
    
SELECT 	
	CONCAT(
			LOWER(SUBSTR(first_name,1,1)),
			LOWER(SUBSTR(last_name,1,4)),
			'_',
			SUBSTR(birth_date,6,2),
			SUBSTR(birth_date,3,2)
        ), 
        COUNT(	CONCAT(
			LOWER(SUBSTR(first_name,1,1)),
			LOWER(SUBSTR(last_name,1,4)),
			'_',
			SUBSTR(birth_date,6,2),
			SUBSTR(birth_date,3,2)
        )) AS uname_count
	FROM employees
    GROUP BY
    	CONCAT(
		LOWER(SUBSTR(first_name,1,1)),
        LOWER(SUBSTR(last_name,1,4)),
        '_',
        SUBSTR(birth_date,6,2),
        SUBSTR(birth_date,3,2)
        )
	ORDER BY 
    	COUNT(CONCAT(
		LOWER(SUBSTR(first_name,1,1)),
        LOWER(SUBSTR(last_name,1,4)),
        '_',
        SUBSTR(birth_date,6,2),
        SUBSTR(birth_date,3,2))) DESC
        LIMIT 1;

    

    
