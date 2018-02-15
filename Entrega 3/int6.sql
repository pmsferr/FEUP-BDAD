.mode columns
.headers on
.nullvalue NULL

/*

Qual o medicamento mais caro ?

*/

SELECT medicamento.nomemedicamento AS medicamento, MAX(medicamento.preco) AS preco
FROM medicamento;