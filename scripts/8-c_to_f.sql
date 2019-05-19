/*
 *
 * 8) Criar uma função que retorna o valor da temperatura em graus Celsius sendo que a entrada
 * é em Fahrenheit.
 * A fórmula será dada.(F=1,8C+32 / C = (F-32) / 1,8)
 *
 */

CREATE OR REPLACE FUNCTION c_to_f
(n NUMBER)
RETURN NUMBER
IS
BEGIN
  RETURN (n - 32) / 1.8;
END c_to_f;
/

SELECT c_to_f(95) FROM dual
/

/* enable serveroutput to diplay block messages. */
SET SERVEROUTPUT ON

DECLARE
  FUNCTION to_celsius
  (n NUMBER)
  RETURN NUMBER
  IS
  BEGIN
    RETURN (n - 32) / 1.8;
  END to_celsius;
BEGIN
  FOR i IN 32..42 LOOP
    dbms_output.put_line('[' || i || '] Fahrenheit corresponde a [' || to_celsius(i) || '] Celsius');
  END LOOP;
END;
/
