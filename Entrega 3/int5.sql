.mode columns
.headers on
.nullvalue NULL

/*

Consulta de um médico nos proximos 7 dias e o paciente de cada consulta

*/

SELECT medico.medicoid, medico.nome AS medico, consulta.dataconsulta AS data, paciente.nome AS paciente
FROM consulta
INNER JOIN medico
ON consulta.medicoid = medico.medicoid
INNER JOIN paciente
ON consulta.pacienteid = paciente.pacienteid
WHERE consulta.dataconsulta >= (SELECT datetime('now'))
AND consulta.dataconsulta <= (SELECT datetime('now','+7 days'))
ORDER BY consulta.dataconsulta ASC;



