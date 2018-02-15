.mode columns
.headers on
.nullvalue NULL

/*

Quais os pacientes com mais de 18 anos

*/

SELECT nome 'nome', datanasc 'data de nascimento'
FROM paciente
WHERE datanasc >= '01/01/1999'
ORDER BY datanasc ASC;