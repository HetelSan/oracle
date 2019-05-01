-- This procedure returns the age to a given date
CREATE OR REPLACE PROCEDURE getting_age (
    p_date     IN         DATE,
    p_years    OUT        NUMBER,
    p_months   OUT        NUMBER,
    p_days     OUT        NUMBER
) IS
BEGIN
  -- getting total years.
  p_years := TRUNC(MONTHS_BETWEEN(SYSDATE, p_date) / 12);

  -- getting total months.
  p_months := TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, p_date), 12));

  -- getting total days.
  p_days := ROUND(
                  (
				   (MOD(MONTHS_BETWEEN(SYSDATE, p_date), 12)) -
                   TRUNC(MOD(MONTHS_BETWEEN(SYSDATE, p_date), 12))
                  ) *
				  (LAST_DAY(SYSDATE) - TRUNC(SYSDATE, 'MM'))
                 );
END getting_age;
/
