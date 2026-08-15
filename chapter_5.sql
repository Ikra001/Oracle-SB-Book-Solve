-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 5 -----------------------------
-----------------------------------------------------------------------------

-- Practice 5.1
-- a
SELECT last_name, salary, job_title
FROM Employees e JOIN Jobs j
ON e.job_id = j.job_id; 

-- b
SELECT department_name, country_name
FROM Departments d
JOIN Locations l
ON d.location_id = l.location_id
JOIN Countries c
ON l.country_id = c.country_id;

-- c
SELECT country_name, COUNT(*) "Departments"
FROM Departments d
JOIN Locations l
ON d.location_id = l.location_id
JOIN Countries c
ON l.country_id = c.country_id
GROUP BY country_name;

-- d
SELECT e.employee_id, COUNT(jh.employee_id) "Job Switches"
FROM Employees e LEFT JOIN Job_History jh
ON e.employee_id = jh.employee_id
GROUP BY e.employee_id;

-- e
SELECT department_name, job_title, COUNT(employee_id)
FROM Departments d
JOIN Employees e
ON d.department_id = e.department_id
JOIN Jobs j
ON e.job_id = j.job_id
GROUP BY d.department_name, j.job_title;

-- f
SELECT e1.last_name, COUNT(e2.employee_id) "Hired Before"
FROM Employees e1 LEFT JOIN Employees e2
ON e1.hire_date > e2.hire_date
GROUP by e1.employee_id, e1.last_name;

-- g
SELECT e1.last_name, COUNT(DISTINCT e2.employee_id) "Hired Before", COUNT(DISTINCT e3.employee_id) "Hire After"
FROM Employees e1
LEFT JOIN Employees e2
ON e1.hire_date > e2.hire_date
LEFT JOIN Employees e3
ON e1.hire_date < e3.hire_date
GROUP by e1.employee_id, e1.last_name;

-- h
SELECT e1.employee_id
FROM Employees e1 JOIN Employees e2
ON e1.salary > e2.salary
GROUP BY e1.employee_id
HAVING COUNT(*) >= 3;

-- i
SELECT e1.employee_id, COUNT(e2.employee_id) + 1 "Rank"
FROM Employees e1 LEFT JOIN Employees e2
ON e1.salary < e2.salary
GROUP BY e1.employee_id;

-- j
SELECT e1.first_name, e1.salary
FROM Employees e1 LEFT JOIN Employees e2
ON e1.salary < e2.salary
GROUP BY e1.employee_id, e1.first_name, e1.salary
HAVING COUNT(e2.employee_id) < 3;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 5 ------------------------------
-----------------------------------------------------------------------------