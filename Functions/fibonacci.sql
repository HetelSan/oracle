CREATE OR REPLACE FUNCTION "Fibonacci"
(n number) RETURN number IS
BEGIN
    IF  n < 2 THEN
        RETURN n;
    ELSE
        RETURN "Fibonacci"(n - 2) + "Fibonacci"(n - 1);
    END IF;
END "Fibonacci";
/
