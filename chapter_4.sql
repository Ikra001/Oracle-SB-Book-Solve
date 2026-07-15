-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 4 -----------------------------
-----------------------------------------------------------------------------

-- Practice 4.1
-- a
SELECT manager_id, COUNT(*)
FROM Employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- b
SELECT department_id, COUNT(salary)
FROM Employees
WHERE salary > 12000
GROUP BY department_id;

-- c
SELECT department_id "Department ID", MIN(salary) "Minimum Salary",
      MAX(salary) "Maximum Salary", ROUND(AVG(salary), 2) "Average Salary"
FROM Employees
WHERE department_id <> 80
GROUP BY department_id
ORDER BY AVG(salary) DESC, MAX(salary) DESC, MIN(salary) DESC;

-----------------------------------------------------------------------------

-- Practice 4.2
-- a
SELECT department_id, ROUND(AVG(salary), 2) AS "Average Salary"
FROM Employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING AVG(salary) <= 7000;

-----------------------------------------------------------------------------

-- Practice 4.3
-- a
SELECT TRUNC(salary / 5000) * 5000 AS "Group", COUNT(*)
FROM Employees
GROUP BY TRUNC(salary / 5000)
ORDER BY "Group";

-- b
SELECT TO_CHAR(hire_date, 'YYYY') YEAR, job_id, COUNT(*)
FROM Employees
GROUP BY YEAR, job_id
ORDER BY YEAR;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 4 ------------------------------
-----------------------------------------------------------------------------