--ddmmaaaa
--22/10/2022: ok
--29/02/2020: ok
--29/02/2019: ok
DO $$
DECLARE
	data INT := 31062021;
	dia INT;
	mes INT;
	ano INT;
	data_valida BOOL := TRUE;
BEGIN
	dia := data / 1000000;
	RAISE NOTICE 'O dia é: %', dia;
	mes := data % 1000000 / 10000;
	RAISE NOTICE 'O mês é: %', mes;
	ano := data % 1000000 % 10000;
	RAISE NOTICE 'O ano é: %', ano;
	IF ano >= 1 THEN
		CASE
			WHEN mes > 12 OR mes < 1 OR dia < 1 OR dia > 31 THEN
				data_valida := FALSE;
				
			
			ELSE 
				IF ((mes = 4 OR mes = 6 OR mes = 9 OR mes = 11) AND dia > 30) THEN
					data_valida := FALSE;
				ELSE 
					IF mes = 2 THEN
						CASE
							WHEN (ano % 4 = 0 AND ano % 100 <> 0) THEN
							IF dia > 29 THEN
								data_valida := FALSE;
							END IF;
						ELSE
							IF dia > 28 THEN
								data_valida := FALSE;
							END IF;
						END CASE;
					END IF;
				END IF;
		END CASE;
	ELSE
		data_valida := FALSE;
	END IF;
	-- Só pra exibir a mensagem
		CASE
			WHEN data_valida THEN
				RAISE NOTICE 'A data %/%/% é válida', dia, mes, ano;
			ELSE
				RAISE NOTICE 'A data %/%/% não é válida', dia, mes, ano;
		END CASE;
END;
$$


DO $$
DECLARE
	valor INT := valor_aleatorio_entre(1,12);
BEGIN
	RAISE NOTICE 'O valor gerado é %', valor;
	CASE
		WHEN valor BETWEEN 1 AND 10 THEN
			CASE
				WHEN valor % 2 = 0 THEN
					RAISE NOTICE 'Par';
				ELSE
					RAISE NOTICE 'Ímpar';
			END CASE;
		ELSE
			RAISE NOTICE 'Valor % fora do intervalo', valor;
	END CASE;
END;
$$