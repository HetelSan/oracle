ALTER USER hr ACCOUNT UNLOCK IDENTIFIED BY hr;

COLUMN object_name FORMAT A25
COLUMN object_type FORMAT A25

SELECT   object_name, object_type
FROM     user_objects
ORDER BY object_type, object_name

