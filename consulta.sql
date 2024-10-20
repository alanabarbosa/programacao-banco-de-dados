DROP VIEW IF EXISTS ContasNaoPagas;

CREATE VIEW ContasNaoPagas AS
SELECT 
    c.id,
    cl.nome, 
    cl.cpf, 
    c.dataVencimento, 
    c.valor
FROM ContaReceber c
JOIN Cliente cl ON c.client_id = cl.id 
WHERE c.Situacao = '1';

SHOW TABLES LIKE 'ContasNaoPagas';

SELECT * FROM ContasNaoPagas;
