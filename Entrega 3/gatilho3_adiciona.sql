/* 
Verifica se a data da consulta marcada se encontra dentro dos limites possiveis,isto é, se a data não é anterior ao dia em que está a ser marcada. 
*/


CREATE TRIGGER IF NOT EXISTS verificar_data
BEFORE INSERT ON Consulta
	WHEN ((SELECT date('now')) > NEW.dataconsulta)
	BEGIN
	SELECT RAISE(ABORT, 'Nao podes adicionar uma consulta numa data anterior a atual');
END;