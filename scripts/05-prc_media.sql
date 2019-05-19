/*
 *
 *  5) Criar uma procedure que irá receber dados de entrada como:
 *  RA, Nome, nota1, nota2, ..., e retornará o resultado:
 *  Aprovado ou Não Aprovado conforme cálculo de média de nota que será fornecido.
 *
 */
CREATE OR REPLACE PROCEDURE prc_media
( p_ra     IN  NUMBER
, p_name   IN  VARCHAR2
, p_nota1  IN  NUMBER
, p_nota2  IN  NUMBER
, p_nota3  IN  NUMBER
, p_nota4  IN  NUMBER
, p_result OUT VARCHAR2
, p_media  OUT NUMBER)
IS
  l_final NUMBER;
BEGIN
  p_media := (p_nota1 + p_nota2 + p_nota3 + p_nota4) / 4;

  IF p_media >= 7 THEN
    p_result := 'Aprovado';
  ELSE
    p_result := 'Reprovado';
  END IF;
END prc_media;
/

/* enable serveroutput to display block messages. */
SET SERVEROUPUT ON

DECLARE
  l_ra     NUMBER       := 123;
  l_name   VARCHAR2(40) := 'Maria';
  l_nota1  NUMBER       := 8;
  l_nota2  NUMBER       := 7;
  l_nota3  NUMBER       := 7;
  l_nota4  NUMBER       := 6;
  l_result VARCHAR2(50);
  l_media  NUMBER;
BEGIN
  prc_media(p_ra     => l_ra,
            p_name   => l_name,
            p_nota1  => l_nota1,
            p_nota2  => l_nota2,
            p_nota3  => l_nota3,
            p_nota4  => l_nota4,
            p_result => l_result,
		        p_media  => l_media);

  dbms_output.put_line('O aluno ' ||
                       l_name ||
                       ' RA=' ||
                       l_ra ||
                       ' esta ' ||
                       l_result ||
                       ' com media [' ||
                       l_media ||
                       ']');
END;
/
