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
describe locations;
describe departments;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 7 ------------------------------
-----------------------------------------------------------------------------