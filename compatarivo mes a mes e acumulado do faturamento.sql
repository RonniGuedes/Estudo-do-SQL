
-- ###   WINDOW FUNCTIONS (FUNÇÕES DE JANELA)   ###
-- ################################################

--       CÁLCULO DE COMPARATIVO NO SQL SERVER      --

-- SINTAXE
-- Utilizamos a seguinte sintaxe para fazer um cálculo de comparativo:
/*

SELECT
	coluna1,
	coluna2,
	coluna3,
	LAG(coluna1, deslocamento, padrao) OVER(ORDER BY coluna2)
FROM
	tabela
ORDER BY coluna2



Onde:

coluna1: é a coluna que tem os valores que queremos comparar
coluna2: é a coluna de datas para que a função entenda que se trata de um comparativo no tempo
deslocamento: quantas linhas pra trás ou pra frente queremos deslocar
padrao: valor padrão se ele desloca pra trás e não encontra nada

*/



CREATE DATABASE Teste;

use Teste;

CREATE TABLE Resultado(
Data_Fechamento datetime,
Faturamento_MM FLOAT);

INSERT INTO Resultado(Data_Fechamento, Faturamento_MM)
VALUES
	('2020/01/01', 8),
	('2020/02/01', 10),
	('2020/03/01', 6),
	('2020/04/01', 9),
	('2020/05/01', 5),
	('2020/06/01', 4),
	('2020/07/01', 7),
	('2020/08/01', 11),
	('2020/09/01', 9),
	('2020/10/01', 12),
	('2020/11/01', 11),
	('2020/12/01', 10);

SELECT * FROM Resultado;


-- Qual é a variação MoM de faturamento? Obs: Considere o faturamento de dez/2019 como sendo 5 (milhões).
-- Resolução:

SELECT
	Data_Fechamento,
	Faturamento_MM,
	LAG(Faturamento_MM, 1, 5) OVER(ORDER BY Data_Fechamento) AS mes_anterior,
	ROUND(Faturamento_MM/LAG(Faturamento_MM, 1, 5) OVER(ORDER BY Data_Fechamento) - 1, 2) 'VAR. % MoM'
FROM
	Resultado
ORDER BY Data_Fechamento;

-- cálculo acumulado do faturamento

select Data_Fechamento, Faturamento_MM,
	sum(Faturamento_MM) over( order by Data_Fechamento rows between unbounded preceding and current row) as Aumulado_Faturamento
from Resultado
order by Data_Fechamento;