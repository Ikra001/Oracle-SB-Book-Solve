-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 8 -----------------------------
-----------------------------------------------------------------------------

-- COPYING EMPLOYEES IN MY_EMPLOYEES TO MODIFY FREELY (DROP AFTER USE)
CREATE TABLE My_Employees AS SELECT * FROM Employees;
DROP TABLE My_Employees;
-- COPYING LOCATIONS IN MY_LOCATIONS TO MODIFY FREELY (DROP AFTER USE)
CREATE TABLE My_Locations AS SELECT * FROM Locations;
DROP TABLE My_Locations;


-- Practice 8.2 (no 8.1)
-- a
UPDATE My_Employees
SET commission_pct = 0
WHERE commission_pct IS NULL;

-- b
UPDATE My_Employees e
SET salary = (
  SELECT MAX(salary)
  FROM My_Employees
  WHERE department_id = e.department_id
);

-- c
UPDATE My_Employees e
SET commission_pct = commission_pct * (
  SELECT COUNT(*)
  FROM My_Employees
  WHERE manager_id = e.employee_id
)
WHERE employee_id IN (
  SELECT manager_id
  FROM My_Employees
  WHERE manager_id IS NOT NULL
);

-- d
UPDATE My_Employees
SET hire_date = TRUNC(hire_date, 'Year')
WHERE hire_date < TO_DATE('01-JAN-2016', 'DD-MON-YYYY');

-----------------------------------------------------------------------------

-- Practice 8.3
-- a
DELETE My_Employees
WHERE salary < 5000;

-- b
DELETE My_Locations
WHERE location_id NOT IN (
  SELECT location_id
  FROM Departments
);

-- c
DELETE My_Employees
WHERE hire_date < TO_DATE('01-01-2016', 'DD-MM-YYYY');

-----------------------------------------------------------------------------

-- Practice 8.4
-- a


-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 8 ------------------------------
-----------------------------------------------------------------------------