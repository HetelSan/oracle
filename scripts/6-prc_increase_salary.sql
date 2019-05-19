/*
 *
 * 6) Criar uma procedure que irá receber o código do funcionário e ano de admissão
 * e retornar o bônus que será pago conforme regras que serão fornecidas.
 *
 */
CREATE OR REPLACE PROCEDURE prc_increase_salary (
  p_emp_id      IN            employees.employee_id%TYPE,
  p_hire_date   IN            employees.hire_date%TYPE,
  p_bonus       OUT           employees.salary%TYPE
) IS
  h_date      employees.hire_date%TYPE;
  today       employees.hire_date%TYPE;
  eval_freq   PLS_INTEGER;
  j_id        employees.job_id%TYPE;
BEGIN
  -- select sysdate into today from dual;
  today := SYSDATE;
  dbms_output.put_line(today);

  SELECT hire_date, job_id
  INTO   h_date, j_id
  FROM   employees
  WHERE  employee_id = p_emp_id;

  IF h_date + ( INTERVAL '12' MONTH ) < today THEN
    eval_freq := 1;
    CASE j_id
      WHEN 'PU_CLERK' THEN
        dbms_output.put_line('Consider 8% salary increase for employee # ' || p_emp_id);
      WHEN 'SH_CLERK' THEN
        dbms_output.put_line('Consider 7% salary increase for employee # ' || p_emp_id);
      WHEN 'ST_CLERK' THEN
        dbms_output.put_line('Consider 6% salary increase for employee # ' || p_emp_id);
      WHEN 'HR_REP' THEN
        dbms_output.put_line('Consider 5% salary increase for employee # ' || p_emp_id);
      WHEN 'PR_REP' THEN
        dbms_output.put_line('Consider 5% salary increase for employee # ' || p_emp_id);
      WHEN 'MK_REP' THEN
        dbms_output.put_line('Consider 4% salary increase for employee # ' || p_emp_id);
      ELSE
        dbms_output.put_line('Nothing to do for employee # ' || p_emp_id);
    END CASE;
  ELSE
    eval_freq := 2;
  END IF;
END prc_increase_salary;
/

/* enable serveroutput to display block messages. */
SET SERVEROUTPUT ON

DECLARE
  l_bonus employees.salary%TYPE;
BEGIN
  prc_increase_salary(131, SYSDATE, l_bonus);
END;
/
