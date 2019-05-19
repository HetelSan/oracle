/*
 *
 * 7) Criar uma função que mostra se um número é primo ou não.
 * Lembrete: Números primos são divisíveis somente por eles mesmos e por um.
 *
 */
CREATE OR REPLACE FUNCTION is_prime
( n NUMBER )
RETURN BOOLEAN
IS
  l_divisor NUMBER := 0;
BEGIN
  FOR i IN 1..n LOOP
    IF MOD(n, i) = 0 THEN
      l_divisor := l_divisor + 1;
    END IF;
  END LOOP;

  IF l_divisor = 2 THEN
    RETURN true;
  ELSE
    RETURN false;
  END IF;
END is_prime;
/

/* enable serveroutput to display block messages. */
SET SERVEROUTPUT ON

DECLARE
  l_total NUMBER := 0;
BEGIN
  FOR i IN 1..10 LOOP
    IF is_prime(i) THEN
      dbms_output.put_line('[' || i || ']');
      l_total := l_total + 1;
    END IF;
  END LOOP;
  dbms_output.put_line('------------------------------------------------');
  dbms_output.put_line('Entre 1 e 10 existem ' || l_total || ' numeros primos.');
END;
/

/* enable serveroutput to display block messages. */
DECLARE
  l_is_prime BOOLEAN;
BEGIN
  l_is_prime := is_prime(&numero);
  IF l_is_prime THEN
    dbms_output.put_line('primo');
  ELSE
    dbms_output.put_line('nao primo');
  END IF;
END;
/
