-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 3 -----------------------------
-----------------------------------------------------------------------------

-- Practice 3.1
-- a
SELECT UPPER(SUBSTR(country_name, 1, 3) || ' ' || SUBSTR(country_name, -3))
FROM Countries;

-- b
SELECT LPAD(first_name || ' ' || last_name, 20, '*') Name
FROM Employees;

-- c
SELECT job_title
FROM Jobs
WHERE LOWER(job_title) LIKE '%manager%';

-----------------------------------------------------------------------------

-- Practice 3.2
-- a
SELECT last_name, ROUND(sysdate - hire_date, 2)
FROM Employees;

-- b
SELECT last_name, TRUNC((sysdate - hire_date) / 365, 3)
FROM Employees;

-----------------------------------------------------------------------------

-- Practice 3.3
-- a
SELECT first_name, ROUND((MONTHS_BETWEEN(sysdate, hire_date)) / 12, 2) YEARS
FROM Employees;

-- b
SELECT TRUNC(ADD_MONTHS(hire_date, 1), 'MONTH') - hire_date + 1 "Days Worked"
FROM Employees;

-----------------------------------------------------------------------------

-- Practice 3.4
-- a
SELECT commission_pct
FROM Employees
WHERE NVL(commission_pct, 0) >=  0.2;

-- b
SELECT last_name, NVL(salary, 0) * (12 * 5 + 6) "Total Salary"
FROM Employees;

-----------------------------------------------------------------------------

-- Practice 3.5
-- a(i)
SELECT TO_CHAR(hire_date, 'Ddth Month, YYYY')
FROM Employees;
-- a(ii)
SELECT TO_CHAR(hire_date, 'Dd Month, YYYY')
FROM Employees;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 3 ------------------------------
-----------------------------------------------------------------------------