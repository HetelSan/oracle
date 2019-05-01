-- Unremark for debugging script.
SET ECHO ON
SET FEEDBACK ON
SET PAGESIZE 49999
SET SERVEROUTPUT ON SIZE UNLIMITED

ALTER USER hr ACCOUNT UNLOCK IDENTIFIED BY hr;

/* View the names and data types of the objects that belogns to the HR Schema. */
COLUMN object_name FORMAT A25
COLUMN object_type FORMAT A25
SELECT   object_name, object_type
FROM     user_objects
ORDER BY object_type, object_name
/

SELECT "FibonacciSequence"
FROM   dual
/

DECLARE
  /* Declare an output variable. */
  lv_output   BINARY_DOUBLE;
BEGIN
  /* Loop through five times. */
  FOR i IN 1..5 LOOP
    dbms_output.put_line('Fatorial de ' || i || ' = [' || LTRIM(TO_CHAR(factorial(i), '99999')) || '].');
  END LOOP;
END;
/

/* Viewing EMPLOYEES Table Data with sql*plus. */
COLUMN first_name FORMAT A20
COLUMN last_name FORMAT A25
COLUMN phone_number FORMAT A20

SELECT   last_name, first_name, phone_number
FROM     employees
ORDER BY last_name
/

DECLARE
  l_birthdate DATE       := TO_DATE('27081962','DDMMYYYY');
  l_years     NUMBER;
  l_months    NUMBER;
  l_days      NUMBER;
BEGIN
  getting_age( p_date   => l_birthdate
             , p_years  => l_years
             , p_months => l_months
             , p_days   => l_days);
  dbms_output.put_line('------------------------------------------------------------------');
  dbms_output.put_line('Quem nasceu em '
                   || to_char(l_birthdate, 'dd/mm/yyyy')
				   || ' possui: '
                   || l_years
				   || ' anos, '
				   || l_months
				   || ' meses e '
				   || l_days
				   || ' dias.');
  dbms_output.put_line('------------------------------------------------------------------');
END;
/
