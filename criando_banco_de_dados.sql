-- criando database
create database banco2;

-- selecionando o banco de dados
use banco2;

-- criando tabela
create table Vendas(
	ID_Venda int, Curso varchar(100),
    Aluno varchar(100), Estado varchar(100),
    Valor decimal(10,2));

-- inserindo dados na tabela
insert into Vendas(ID_Venda, Curso, Aluno, Estado, Valor)
values(1, 'Excel', 'João', 'SP', 100),
	  (2, 'VBA', 'Lucas', 'RJ', 50),
      (3, 'Excel', 'Alice', 'SP', 100),
      (4, 'Excel', 'Pedro', 'PE', 100),
      (5, 'VBA', 'Amanda', 'BA', 50),
      (6, 'Power BI', 'Rita', 'RS', 80),
      (7, 'Excel', 'Julia', 'RJ', 100),
      (8, 'Power BI', 'Caio', 'SP', 80),
      (9, 'Power BI', 'Lara', 'MG', 80),
      (10, 'Excel', 'Rogério', 'AC', 100);

-- selecionar dados da tabela - visualização
select * from Vendas;
-- só algumas colunas 
select Aluno, Curso from Vendas;

-- ordenando dados na tabela
select * from Vendas order by Aluno;

-- filtrar dados da tabela
select * from Vendas where Estado = 'RJ';

-- alteração de valores dentro da tabela
update Vendas set Valor = 150 
where Curso = 'VBA';

select * from Vendas;

-- deletar uma linha dentro da tabela
delete from Vendas where ID_Venda = 10;
select * from Vendas;

-- manter a tabela, mas excluir todos os dados da tabela
truncate table Vendas;
select * from Vendas;

      
      
      
      
      
      
      
      