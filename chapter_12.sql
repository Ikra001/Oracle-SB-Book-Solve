-----------------------------------------------------------------------------
---------------------------- START OF CHAPTER 12 ----------------------------
-----------------------------------------------------------------------------

-- COPYING Countries TO My_Countries TO MODIFY FREELY (DROP AFTER USE)
CREATE TABLE My_Countries AS SELECT * FROM Countries;
DROP TABLE My_Countries;

SET SERVEROUTPUT ON;
SHOW ERRORS;

-- NO 12.1

-- Practice 12.2
-- a
DECLARE
    jdate DATE;
    years NUMBER;
BEGIN
    -- first retrieve hire_date and store the value into JDATE variable
    SELECT hire_date INTO jdate
    FROM Employees
    WHERE employee_id > 110;

    -- calculate yearf from the hire_date field
    years := (MONTHS_BETWEEN(sysdate, jdate) / 12);

    IF years >= 10 THEN
        DBMS_OUTPUT.PUT_LINE('The employee worked 10 years or more');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The employee worked less than 10 years');
    END IF;
EXCEPTION
    -- handle exceptions one by one here
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employees is not present in database.');

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many employees for this query');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('I don''t know what happened!');
END;
/

-- b
ALTER TABLE My_Countries
ADD CONSTRAINT uk_country_id UNIQUE (country_id);

BEGIN
    -- INSERT INTO My_Countries VALUES ('AA', 'AAA', 67);
    INSERT INTO My_Countries VALUES ('AR', 'Argentina', 20);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate country_id error!');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Other error!');
END;
/

-----------------------------------------------------------------------------

-- Practice 12.3
-- a
BEGIN
    FOR R IN ( SELECT employee_id, hire_date FROM Employees )
    LOOP
        IF TO_CHAR(R.hire_date, 'DD/MM') = TO_CHAR(sysdate, 'DD/MM') THEN -- add ' OR TO_CHAR(R.hire_date, 'DD') = '11' '
            DBMS_OUTPUT.PUT_LINE('Happy Anniversary ' || R.employee_id);
        END IF;
    END LOOP;
END;
/

-----------------------------------------------------------------------------

-- NO 12.4
-- NO 12.5

-----------------------------------------------------------------------------

-- Practice 12.6
-- a
CREATE OR REPLACE FUNCTION ISNUMBER (val IN VARCHAR2)
RETURN VARCHAR IS
    num NUMBER;
BEGIN
    num := TO_NUMBER(val);
    RETURN 'YES';
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'NO';
END;
/

DROP FUNCTION ISNUMBER;

-- b
CREATE TABLE Students (
    name VARCHAR2(20),
    roll NUMBER UNIQUE,
    cgpa NUMBER
);

CREATE OR REPLACE TRIGGER HELLO_WORLD6
AFTER DELETE ON Students
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World 6');
END;
/

INSERT INTO Students VALUES ('James', 21);
INSERT INTO Students VALUES ('Bond', 20);
DELETE FROM Students;

DROP TABLE Students;
DROP TRIGGER HELLO_WORLD6;

-- c
CREATE OR REPLACE TRIGGER INVALID_NAME
BEFORE INSERT ON STUDENTS
FOR EACH ROW
DECLARE
    invalid_name EXCEPTION;
BEGIN
    FOR i IN 1..LENGTH(:NEW.NAME) LOOP
        IF NOT (
            ASCII(SUBSTR(:NEW.NAME, i, 1)) BETWEEN 65 AND 90
            OR
            ASCII(SUBSTR(:NEW.NAME, i, 1)) BETWEEN 97 AND 122
        ) THEN
            RAISE invalid_name;
        END IF;
    END LOOP;

EXCEPTION
    WHEN invalid_name THEN
        RAISE_APPLICATION_ERROR(-20001, 'Invalid student name');
END;
/

INSERT INTO Students VALUES ('Ray', 12);
INSERT INTO Students VALUES ('Ray21', 11);
SELECT * FROM Students;

DROP TRIGGER INVALID_NAME;

-- b
CREATE TABLE Low_CGPA_Students (
    name VARCHAR(50)
);

CREATE OR REPLACE TRIGGER low_cgpa_record
BEFORE INSERT OR UPDATE OF CGPA ON Students
FOR EACH ROW
BEGIN
    IF :NEW.CGPA < 2.0 THEN
        INSERT INTO Low_CGPA_Students VALUES (:NEW.name);
    END IF;
END;
/

INSERT INTO Students VALUES ('Alice', 1, 3.9);
INSERT INTO Students VALUES ('Don', 2, 1.9);
INSERT INTO Students VALUES ('Xinping', 3, 2);

UPDATE Students SET CGPA = 1.2 WHERE roll = 3;

SELECT * FROM Low_CGPA_Students;

DROP TABLE Low_CGPA_Students;
DROP TRIGGER low_cgpa_record;

-----------------------------------------------------------------------------
----------------------------- END OF CHAPTER 12 -----------------------------
-----------------------------------------------------------------------------