-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 2 -----------------------------
-----------------------------------------------------------------------------

-- Practice 2.1
-- a
SELECT country_name
FROM Countries;

-- b
SELECT job_title
FROM Jobs;

-- c
SELECT manager_id
FROM Employees;

-- d
SELECT DISTINCT city
FROM Locations;

-- e
SELECT location_id, street_address, city, state_province, postal_code
FROM Locations;

-----------------------------------------------------------------------------

-- Practice 2.2
-- a
SELECT (first_name || ' ' || last_name) Name
FROM Employees
WHERE hire_date < '01-JAN-2016';

-- b (used subquery)
SELECT *
FROM Locations
WHERE country_id IN (
  SELECT country_id
  FROM Countries
  WHERE country_name IN ('Canada', 'Germany', 'United Kingdom')
);

-- c
SELECT first_name
FROM Employees
WHERE commission_pct IS NULL;

-- d
SELECT first_name
FROM Employees
WHERE last_name LIKE 'A%';

-- e
SELECT first_name
FROM Employees
WHERE last_name LIKE 'S%n';

-- f
SELECT department_name
FROM Departments
WHERE department_id IN (
  SELECT department_id
  FROM Employees
  WHERE manager_id = 100
);

-- g
SELECT (first_name || ' ' || last_name) Name
FROM Employees
WHERE job_id = 'AD_PRES' AND salary >= 23000;

-- h
SELECT (first_name || ' ' || last_name) Name
FROM Employees
WHERE lower(last_name) NOT LIKE '%s%';

-- i
SELECT (first_name || ' ' || last_name) Name, commission_pct
FROM Employees
WHERE commission_pct <= 0.3;

-- j
SELECT (first_name || ' ' || last_name) Name
FROM Employees
WHERE hire_date > '01-JAN-2016';

-- k (used TO_CHAR())
SELECT (first_name || ' ' || last_name) Name
FROM Employees
WHERE TO_CHAR(hire_date, 'YYYY') = '2016';

-----------------------------------------------------------------------------

-- Practice 2.3
-- a
SELECT (first_name || ' ' || last_name) Name, salary, commission_pct
FROM Employees
-- WHERE job_id = 'AD_PRES'
ORDER BY commission_pct, salary desc;

-- b
SELECT country_name
FROM Countries
ORDER BY country_name;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 2 ------------------------------
-----------------------------------------------------------------------------