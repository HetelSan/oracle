/*
 *  1) Criar um bloco PL/SQL que mostre a tabuada de 1 a 10.
 */

/* enable the serveroutput to display block messages */
SET SERVEROUTPUT ON

DECLARE
BEGIN
  FOR i IN 1..10 LOOP
    dbms_output.put_line(CHR(10) || 'Tabuada do ' || i);
    FOR j IN 1..10 LOOP
      dbms_output.put_line(i || ' X ' || j || ' = ' || i * j);
    END LOOP;
  END LOOP;
END;
/
