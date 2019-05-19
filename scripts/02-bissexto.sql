/*
 *
 * 2) Criar um bloco PL/SQL para mostrar anos bissextos entre 2000 e 2100
 *    Onde: ano será bissexto quando for divisível por 4, mas não por 100 ou
 *    quando for divisível por 400
 *
 */

/* enable the serveroutput to display block messages. */
SET SERVEROUTPUT ON

DECLARE
  FUNCTION bissexto
  ( p_year NUMBER )
  RETURN BOOLEAN
  IS
  BEGIN
    IF (MOD(p_year, 4) = 0 AND MOD(p_year, 100) != 0)
	 OR MOD(p_year, 400) = 0 THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END bissexto;
BEGIN
  FOR i IN 2000..2100 LOOP
    IF bissexto(i) THEN
      dbms_output.put_line(i || ' - ' || TO_CHAR(LAST_DAY(TO_DATE('0102' || i, 'DDMMYYYY')), 'DD/MM/YYYY'));
    END IF;
  END LOOP;
END;
/
