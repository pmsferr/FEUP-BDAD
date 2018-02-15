.mode columns
.headers on
.nullvalue NULL

/*

consultas de um determinado medico

*/

SELECT medico.medicoid, medico.nome, consulta.dataconsulta
FROM consulta
INNER JOIN medico
ON consulta.medicoid = medico.medicoid
WHERE medico.medicoid = 2 
GROUP BY consulta.dataconsulta; --ID do medico