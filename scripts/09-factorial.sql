/*
 *
 * 9) Criar um função que retorna o fatorial de número.
 *
 */

/* enable serveroutput to display block messages. */
SET SERVEROUTPUT ON

DECLARE
  FUNCTION factorial
  (n NUMBER)
  RETURN NUMBER
  IS
  BEGIN
    IF n <= 1 THEN
      RETURN 1;
    ELSE
      RETURN n * factorial(n - 1);
    END IF;
  END factorial;
BEGIN
  FOR i IN 1..6 LOOP
    dbms_output.put_line('O fatorial de ' || i || ' = [' || LTRIM(TO_CHAR(factorial(i), '999')) || ']');
  END LOOP;
END;
/
