CREATE OR REPLACE FUNCTION gerador_num_aleat()
RETURNS SETOF INT
AS $$
DECLARE
  num INT;
BEGIN
  FOR i IN 1..50 LOOP
    num := floor(random()*100 - 50);
    RETURN NEXT num;
  END LOOP;
END;
$$ 
LANGUAGE plpgsql;

SELECT * FROM gerador_num_aleat();