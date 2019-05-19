/*
 *
 * 3) Criar um bloco PL/SQL que mostre os 10 primeiros números da série de Fibonacci
 *    sendo esperado 1, 1, 2, 3, 5, 8, 13, 21, 34 e 55
 *
 */

/* enable serveroutput to display block messages. */
SET SERVEROUTPUT ON

DECLARE
  l_result VARCHAR2(100);

  FUNCTION fibonacci
  ( n NUMBER )
  RETURN NUMBER
  IS
  BEGIN
    IF n < 2 THEN
      RETURN n;
    ELSE
      RETURN fibonacci(n - 2) + fibonacci(n - 1);
    END IF;
  END fibonacci;
BEGIN
  FOR i IN 1..10 LOOP
    IF l_result IS NOT NULL THEN
      l_result := l_result || ', ' || fibonacci(i);
    ELSE
      l_result := fibonacci(i);
    END IF;
  END LOOP;
  dbms_output.put_line('--- first 10 number''s of fibonacci sequence ---');
  dbms_output.put_line(l_result);
END;
/
