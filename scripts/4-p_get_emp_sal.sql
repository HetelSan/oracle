/*
 *  4) Criar uma procedure que recebe o código de um empregado e pesquisa em uma
 *     tabela fornecida e exibe alguns dados pedidos (nome, e-mail, ...)
 */
CREATE OR REPLACE PROCEDURE p_get_emp_sal
( p_job VARCHAR2 )
IS
  /* declare a cursor and local variables */
  l_first_name   employees.first_name%TYPE;
  l_salary       employees.salary%TYPE;

  CURSOR cur_emp IS
    SELECT first_name, salary
    FROM   employees
    WHERE  job_id = p_job;
BEGIN
  OPEN cur_emp;
  LOOP
    FETCH cur_emp INTO l_first_name, l_salary;
    EXIT WHEN cur_emp%NOTFOUND;
    dbms_output.put_line(l_first_name || ' - ' || l_salary);
  END LOOP;
  CLOSE cur_emp;
END p_get_emp_sal;
/

/* enable serveroutput to display block messages. */
BEGIN
  p_get_emp_sal('ST_MAN');
END;
/
