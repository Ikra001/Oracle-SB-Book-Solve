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

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 6 ------------------------------
-----------------------------------------------------------------------------