# --- ANÁLISES DE DADOS COM SQL --- #

# =======        PARTE 1:        =======#
# =======  CRIANDO AGRUPAMENTOS  =======#

-- CASE 1. O preço médio de aluguel dos filmes.
select round(avg(preco_aluguel),2) as 'Preço médio aluguel dos filmes' from filmes;

-- CASE 2. O preço médio para se alugar filmes na hashtagmovie para cada gênero de filme e a contagem de filmes.
select genero, 
		round(avg(preco_aluguel),2) as 'Preço Aluguel Médio',
		count(*) as 'Quantidade de Filmes'
from filmes group by genero;


# =======              PARTE 2:               =======#
# =======       FILTROS EM AGRUPAMENTOS       =======#

-- CASE 3: Fazer a mesma análise, mas considerando apenas os filmes com ANO_LANCAMENTO igual a 2011.
select genero, 
		round(avg(preco_aluguel),2) as 'Preço Aluguel Médio',
		count(*) as 'Quantidade de Filmes'
from filmes where ano_lancamento = 2011
group by genero;


# =======                         PARTE 3:                           =======#
# =======  SUBQUERIES: UTILIZANDO UM SELECT DENTRO DE OUTRO SELECT   =======#

-- CASE 4. Análise de desempenho dos alugueis. Para isso, uma análise comum é identificar quais aluguéis tiveram nota acima da média.
-- média dos alugueis
SELECT AVG(nota) FROM alugueis;
-- calculando CASE 4:
select * from alugueis
where nota >= (SELECT AVG(nota) FROM alugueis)
order by nota desc;


# =======           PARTE 4:             =======#
# =======  Criando Views - CREATE VIEW   =======#
-- Salvando tabelas
-- CREATE/DROP VIEW: Guardando o resultado de uma consulta no nosso banco de dados


-- CASE 5. Crie uma view para guardar o resultado do SELECT abaixo.

CREATE VIEW resultado AS
SELECT
	genero,
	ROUND(AVG(preco_aluguel), 2) AS media_preco,
    COUNT(*) AS qtd_filmes
FROM filmes
GROUP BY genero;

SELECT * FROM resultado;
-- para apagar a view
drop view resultado;