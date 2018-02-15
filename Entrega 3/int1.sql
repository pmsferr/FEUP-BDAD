.mode columns
.headers on
.nullvalue NULL

/*

Quais pacientes são atendidos por determidado médico ?

*/

SELECT paciente.nome
FROM paciente
WHERE pacienteid IN (
    SELECT pacienteid
    FROM consulta
    WHERE medicoid = 2
);