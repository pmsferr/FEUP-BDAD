SELECT quantidade
FROM medicamentofarmacia
WHERE medicamentofarmacia.medicamentoid = 95;

/*
RECEITAID tem que ser sempre um valor novo, por causa de uma nova receita

MEDICAMENTOID 95, IRÃO APARECER DUAS INSTANCIAS NO ECRÃ DEVIDO A TER 2 INSERTS NA
BASE DE DADOS COM 95

DECREMENTA SEMPRE 10
*/

INSERT INTO receitamedicamento(receitaid, medicamentoid, quantidade) VALUES (42, 95, 10);


SELECT quantidade
FROM medicamentofarmacia
WHERE medicamentofarmacia.medicamentoid = 95 ;