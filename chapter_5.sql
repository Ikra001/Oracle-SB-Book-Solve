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

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 2 ------------------------------
-----------------------------------------------------------------------------