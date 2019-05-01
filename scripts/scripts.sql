-- Unremark for debugging script.
SET ECHO ON
SET FEEDBACK ON
SET PAGESIZE 49999
SET SERVEROUTPUT ON SIZE UNLIMITED

ALTER USER hr ACCOUNT UNLOCK IDENTIFIED BY hr;

COLUMN object_name FORMAT A25
COLUMN object_type FORMAT A25

SELECT   object_name, object_type
FROM     user_objects
ORDER BY object_type, object_name

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
