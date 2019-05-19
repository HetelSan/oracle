CREATE OR REPLACE FUNCTION fibonaccisequence
RETURN VARCHAR2 IS
  /* Declare an output variable. */
  lv_output VARCHAR2(40);
BEGIN
  /* Loop through enough for the DaVinci Code myth. */
  FOR i IN 1..11 LOOP
    IF lv_output IS NOT NULL THEN
	  lv_output := lv_output || ', ' || LTRIM(TO_CHAR(fibonacci(i), '999'));
	ELSE
	  lv_output := LTRIM(TO_CHAR(fibonacci(i), '999'));
	END IF;
  END LOOP;
  RETURN lv_output;
END fibonaccisequence;
/
