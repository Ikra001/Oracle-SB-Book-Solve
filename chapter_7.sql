-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 7 -----------------------------
-----------------------------------------------------------------------------

-- Practice 7.1
-- a
SELECT employee_id
FROM Employees
MINUS
SELECT manager_id
FROM Employees;

-- b
SELECT last_name
FROM Employees
WHERE employee_id IN (
    SELECT employee_id
    FROM Employees
    MINUS
    SELECT manager_id
    FROM Employees
);

-- c
SELECT location_id
FROM Locations
MINUS
SELECT location_id
FROM Departments;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 7 ------------------------------
-----------------------------------------------------------------------------