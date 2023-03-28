-- Tipos de select
select * from clientes;

-- especificando as colunas
select Nome, Sobrenome, Email from clientes;

-- mudando nome de colunas - não muda o nome na base de dados original
select Data_Venda as 'Data da venda', ID_Produto as 'ID do Produto', Qtd_Vendida as 'Quantidade Vendida' from pedidos;

-- limitando o número de linhas
select * from pedidos limit 100;

-- consulta na tabela clientes e ordenando de acordo com o nome e sobrenome do cliente, ordem alfabética
select * from clientes order by Nome asc, Sobrenome asc;

-- consulta na tabela clientes e ordenando de acordo com a renda mensal da maior para a menor
select * from clientes order by Renda_Anual desc;

-- consulta na tabela clientes e ordenando de acordo com a data de nascimento do mais novo para o mais velho
select Nome, Sobrenome, Email, Data_Nascimento
from clientes order by Data_Nascimento; 

-- criando filtros com where
-- selecionando da tabela clientes apenas clientes do sexo femenino
select * from clientes where Sexo = 'F';

-- selecionando da tabela produtos apenas produtos com preços acima de 2.000
 select * from produtos where Preco_Unit > 2000;
-- selecionando da tabela produtos apenas produtos com preços diferentes de 3.100
 select * from produtos where Preco_Unit <> 3100;
 
 -- selecionando os pedidos realixados no dia 10/03/2019 - observar a ordem que está no banco de dados
  select * from pedidos where Data_Venda = '2019-03-10';
  
  -- cálculos 
  -- total de receita dos pedidos da tabela pedidos
  select sum(Receita_Venda) as 'Receita Total' from pedidos;
  
  -- quantidade de clientes do sexo masculino na tabela de clientes
  select count(Nome) as 'Qtd Clientes Masculinos' from clientes
  where Sexo = 'M';
  
  -- média de salários dos clientes
  select avg(Renda_Anual) as 'Média Salarial' from clientes;

-- menor preço de produto
select min(Preco_Unit) as 'Menor Preço de Produto' from produtos; 

-- criando agrupamentos
-- quantitade de produtos por marca - usando contagem:
select Marca_Produto, count(Marca_Produto) as 'Qtd Produtos'
from produtos group by Marca_Produto;

-- quantidade de clientes por escolaridade
select Escolaridade, count(Escolaridade) as 'Qtd de Clientes'
from clientes group by Escolaridade;

-- total de receita por id da loja
select ID_loja, sum(Receita_Venda) as 'Receita Total'
from pedidos group by ID_Loja order by ID_Loja;

-- Relacionando tabelas - join
-- consultar a tabela de pedidos e retornar as colunas
-- de Loja, Data_venda e Receita_Venda
select Loja, Data_venda, Receita_Venda from pedidos
inner join lojas on pedidos.ID_Loja = lojas.ID_Loja;

-- total de receita por nome das lojas
select Loja, sum(Receita_Venda) as 'Receita total' from pedidos
inner join lojas on pedidos.ID_Loja = lojas.ID_Loja 
group by Loja;
