-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 6 -----------------------------
-----------------------------------------------------------------------------

-- Practice 6.1
-- a
SELECT last_name
FROM Employees
WHERE department_id = (
    SELECT department_id
    FROM Departments
    WHERE department_name = 'Sales'
);

-- b
SELECT last_name, salary
FROM Employees
WHERE salary > ANY (
    SELECT salary
    FROM Employees
    WHERE department_id = (
        SELECT department_id
        FROM Departments
        WHERE department_name = 'Sales'
    )
);

-- c
SELECT last_name, salary
FROM Employees
WHERE salary > ALL (
    SELECT salary
    FROM Employees
    WHERE department_id = (
        SELECT department_id
        FROM Departments
        WHERE department_name = 'Sales'
    )
);

-- d
SELECT last_name, salary
FROM Employees
WHERE salary BETWEEN (
    SELECT AVG(salary) - 5000
    FROM Employees
    WHERE department_id = (
        SELECT department_id
        FROM Departments
        WHERE department_name = 'Sales'
    )
) AND (
    SELECT AVG(salary) + 5000
    FROM Employees
    WHERE department_id = (
        SELECT department_id
        FROM Departments
        WHERE department_name = 'Sales'
    )
);

-- Practice 6.2
-- a
SELECT last_name, salary
FROM Employees e1
WHERE (
    SELECT COUNT(*)
    FROM Employees e2
    WHERE e1.salary > e2.salary
) >= 3;

-- b
SELECT (
    SELECT department_name
    FROM Departments d
    WHERE d.department_id = e1.department_id
) AS Department
FROM Employees e1
WHERE e1.department_id IS NOT NULL
GROUP BY e1.department_id
HAVING AVG(salary) > ALL (
    SELECT MIN(salary)
    FROM Employees e2
    WHERE e1.department_id <> e2.department_id
    GROUP BY department_id
);

-- c
SELECT (
    SELECT department_name
    FROM Departments d
    WHERE d.department_id = e1.department_id
) AS Department
FROM Employees e1
WHERE e1.department_id IS NOT NULL
GROUP BY e1.department_id
HAVING COUNT(*) > ALL (
    SELECT COUNT(*)
    FROM Employees e2
    WHERE e2.department_id <> e1.department_id
    GROUP BY e2.department_id
);

-- d
SELECT last_name
FROM Employees e
WHERE EXISTS (
    SELECT *
    FROM Job_History jh
    WHERE jh.employee_id = e.employee_id AND jh.department_id <> e.department_id
);

-- e
SELECT last_name, minsal, maxsal
FROM Employees e, (
    SELECT department_id, MIN(salary) minsal, MAX(salary) maxsal
    FROM Employees
    GROUP BY department_id
) d
WHERE e.department_id = d.department_id;

-- f
SELECT (
    SELECT job_title
    FROM Jobs j
    WHERE j.job_id = e1.job_id
) AS "Job Title", e1.last_name
FROM Employees e1
WHERE e1.salary = (
    SELECT MAX(e2.salary)
    FROM Employees e2
    WHERE e2.job_id = e1.job_id
);

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 6 ------------------------------
-----------------------------------------------------------------------------