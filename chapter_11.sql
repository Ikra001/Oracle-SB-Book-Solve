-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 11 -----------------------------
-----------------------------------------------------------------------------

-- NO 11.1
-- NO 11.2

-- Practice 11.3
-- a
SELECT d.department_name,
       COUNT(CASE WHEN e.salary < 5000 THEN 1 END) AS "C",
       COUNT(CASE WHEN e.salary BETWEEN 5000 AND 9999 THEN 1 END) AS "B",
       COUNT(CASE WHEN e.salary BETWEEN 10000 AND 14999 THEN 1 END) AS "A",
       COUNT(CASE WHEN e.salary >= 15000 THEN 1 END) AS "A+"
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;

-- b
SELECT d.department_name,
       COUNT(DECODE(FLOOR(e.salary / 5000), 0, 1)) AS "C",
       COUNT(DECODE(FLOOR(e.salary / 5000), 1, 1)) AS "B",
       COUNT(DECODE(FLOOR(e.salary / 5000), 2, 1)) AS "A",
       COUNT(DECODE(FLOOR(e.salary / 5000), 3, 1)) AS "A+"
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name;

-- c
SELECT e.employee_id,
       ed.employee_count AS "Employee Count",
       md.employee_count AS "Manager Count"
FROM Employees e
JOIN (
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employees
    GROUP BY department_id
) ed
    ON ed.department_id = e.department_id
JOIN Employees m
    ON m.employee_id = e.manager_id
JOIN (
    SELECT department_id, COUNT(*) AS employee_count
    FROM Employees
    GROUP BY department_id
) md
    ON md.department_id = m.department_id;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 11 ------------------------------
-----------------------------------------------------------------------------