.mode columns
.headers on
.nullvalue NULL

/*

Lista dos medicamentos de uma receita

*/


SELECT receitamedicamento.medicamentoid, medicamento.nomemedicamento AS nome_medicamento
FROM receitamedicamento
INNER JOIN medicamento
ON receitamedicamento.medicamentoid = medicamento.medicamentoid
WHERE receitamedicamento.receitaid = 3;