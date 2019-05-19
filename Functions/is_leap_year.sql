CREATE OR REPLACE FUNCTION is_leap_year
(p_year NUMBER)
RETURN NUMBER
IS
BEGIN
  RETURN CASE
           WHEN ( MOD(p_year, 4) = 0 AND MOD(p_year, 100) <> 0 ) OR
                ( MOD(p_year, 400) = 0 ) THEN 1
           ELSE 0
         END;
END;
/
