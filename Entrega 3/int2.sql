.mode columns
.headers on
.nullvalue NULL

/*

Quais os 5 médico tem o maior numero de consultas ?

*/

SELECT medico.medicoid, medico.nome, count(*) AS total
FROM consulta INNER JOIN medico
ON consulta.medicoid = medico.medicoid
GROUP BY medico.medicoid
ORDER BY total DESC
LIMIT 5;