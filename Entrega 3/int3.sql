.mode columns
.headers on
.nullvalue NULL

/*

Saber em qual farmácia se encontra determinado medicamento e qual sua quantidade e preço

*/

SELECT medicamentofarmacia.farmaciaid, farmacia.nome, medicamentofarmacia.quantidade, medicamento.preco
FROM medicamentofarmacia
INNER JOIN medicamento
ON medicamentofarmacia.medicamentoid = medicamento.medicamentoid
INNER JOIN farmacia
ON medicamentofarmacia.farmaciaid = farmacia.farmaciaid
WHERE medicamentofarmacia.medicamentoid = 11; -- escolher qual a farmacia