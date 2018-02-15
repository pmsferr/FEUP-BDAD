/*

toda vez que há um insert na tabela receita medicamento
ele atualiza a quantidade de medicamentos da farmácia

*/

CREATE TRIGGER adiciona_medicamento
AFTER INSERT ON receitamedicamento
FOR EACH ROW
BEGIN
UPDATE medicamentofarmacia
SET quantidade = COALESCE(quantidade, 0) - NEW.quantidade
WHERE medicamentoid = NEW.medicamentoid;
END