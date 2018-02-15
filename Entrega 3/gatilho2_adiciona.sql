.mode columns
.headers on
.nullvalue NULL

/*
Se remover um paciente remove as consultas dele
*/
 
CREATE TRIGGER apagaConsulta
AFTER DELETE ON paciente
FOR EACH ROW 
BEGIN
DELETE FROM consulta WHERE pacienteid = OLD.pacienteid;
END;
