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


SELECT TRUNC(MONTHS_BETWEEN(TRUNC(SYSDATE), dat_nascimento) / 12) anos
     , TRUNC(MOD(MONTHS_BETWEEN(TRUNC(SYSDATE), dat_nascimento), 12)) meses
     , ROUND
       (
         (
           (MOD(MONTHS_BETWEEN(TRUNC(SYSDATE), dat_nascimento), 12))
           -
           TRUNC(MOD(MONTHS_BETWEEN(TRUNC(SYSDATE), dat_nascimento), 12))
         ) * ((LAST_DAY(TRUNC(SYSDATE))) - (TRUNC(SYSDATE, 'MM')))
       ) dias
FROM
(
  SELECT TO_DATE('27081962', 'ddmmyyyy') dat_nascimento
  FROM dual
) i
/

CREATE TABLE performance_parts
( performance_id VARCHAR2(2)
, name           VARCHAR2(80)
, weight         NUMBER
, )

-- calcular a equação do segundo grau
create or replace procedure equacao_segundo_grau
  (p_a number, p_b number, p_c number)
is
  l_delta     number;
  l_result1   number;
  l_result2   number;
begin
  l_delta := p_b * p_b - 4 * p_a * p_c;

  if p_a = 0 or l_delta < 0 then
    dbms_output.put_line('Impossivel calcular');
  else
    l_result1 := (- p_b + sqrt(l_delta)) / (2 * p_a);
    l_result2 := (- p_b - sqrt(l_delta)) / (2 * p_a);
	  dbms_output.put_line('R1 = ' || trunc(l_result1, 5));
	  dbms_output.put_line('R2 = ' || trunc(l_result2, 5));
  end if;
end;
/

begin
  equacao_segundo_grau(10.0, 20.1, 5.1);
  equacao_segundo_grau(0.0, 20.0, 5.0);
  equacao_segundo_grau(10.3, 203.0, 5.0);
  equacao_segundo_grau(10.0, 3.0, 5.0);
end;
/



create or replace procedure aumenta_preco
( p_product_id number, p_percentage number)
is
begin
  update products
     set product_price = product_price + product_price * p_percentage / 100
   where product_id = p_product_id;
end;
/



-- procedure do banco:
CREATE OR REPLACE PROCEDURE PRC_IPDA
  (P_SEQ_POLITICA_DESCONTO IN  F_ITENS_POL_DESCTO_AUDIT.SEQ_POLITICA_DESCONTO%TYPE,
   P_NUM_ORDEM             IN  F_ITENS_POL_DESCTO_AUDIT.NUM_ORDEM%TYPE,
   P_DSC_OS_USER           OUT F_ITENS_POL_DESCTO_AUDIT.DSC_OS_USER%TYPE,
   P_DAT_TRANSACAO         OUT F_ITENS_POL_DESCTO_AUDIT.DAT_TRANSACAO%TYPE)
IS
BEGIN
  SELECT FIRST_VALUE(A.DSC_OS_USER)   OVER (PARTITION BY A.SEQ_POLITICA_DESCONTO,
                                                         A.NUM_ORDEM
                                                ORDER BY A.DAT_TRANSACAO DESC NULLS LAST) AS DSC_OS_USER,
         FIRST_VALUE(A.DAT_TRANSACAO) OVER (PARTITION BY A.SEQ_POLITICA_DESCONTO,
                                                         A.NUM_ORDEM
                                                ORDER BY A.DAT_TRANSACAO DESC NULLS LAST) AS DAT_TRANSACAO
    INTO P_DSC_OS_USER, P_DAT_TRANSACAO
    FROM F_ITENS_POL_DESCTO_AUDIT A
   WHERE SEQ_POLITICA_DESCONTO = P_SEQ_POLITICA_DESCONTO--10279
     AND NUM_ORDEM = P_NUM_ORDEM--1
     AND ROWNUM < 2;
EXCEPTION
  WHEN OTHERS THEN
    P_DSC_OS_USER   := NULL;
    P_DAT_TRANSACAO := NULL;
END;
/

BEGIN
	 PRC_IPDA
	   (P_SEQ_POLITICA_DESCONTO => :F_ITENS_POLITICA_DESCONTO.SEQ_POLITICA_DESCONTO,
	    P_NUM_ORDEM             => :F_ITENS_POLITICA_DESCONTO.NUM_ORDEM,
	    P_DSC_OS_USER           => :F_ITENS_POLITICA_DESCONTO.DSC_OS_USER,
	    P_DAT_TRANSACAO         => :F_ITENS_POLITICA_DESCONTO.DAT_TRANSACAO);
END;
/


DECLARE
  l_output VARCHAR2(100) := '';
BEGIN
  dbms_output.put_line('-------------------------------------------------');
  FOR i IN 1..10 LOOP
    IF l_output IS NOT NULL THEN
      l_output := l_output || ', ' || LTRIM(TO_CHAR(fibonacci(i),'999'));
    ELSE
      l_output := LTRIM(TO_CHAR(fibonacci(i), '999'));
    END IF;
  END LOOP;
  dbms_output.put_line(l_output);
END;
/

declare
begin
  for i in 2000..2100 loop
    dbms_output.put_line('O ano [' || i || '] ' || '[' || is_leap_year(i) || '].');
  end loop;
end;
/
