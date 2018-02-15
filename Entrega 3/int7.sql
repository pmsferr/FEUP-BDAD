.mode columns
.headers on
.nullvalue NULL

/*

qual o total do gasto de um receita x

 */


SELECT SUM(preco*quantidade) FROM (SELECT receitamedicamento.medicamentoid,receitamedicamento.quantidade, medicamento.preco AS preco
FROM receitamedicamento
INNER JOIN medicamento
ON medicamento.medicamentoid = receitamedicamento.medicamentoid
WHERE receitamedicamento.receitaid = 2) ;
--Group by quantidade