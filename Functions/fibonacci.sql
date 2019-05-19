CREATE OR REPLACE FUNCTION fibonacci
(n number) RETURN number IS
BEGIN
    IF  n < 2 THEN
        RETURN n;
    ELSE
        RETURN fibonacci(n - 2) + fibonacci(n - 1);
    END IF;
END fibonacci;
/
