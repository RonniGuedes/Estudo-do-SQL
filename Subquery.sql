-- Subqueries

-- Exemplo: Quais funcionários recebem um salário acima da média 
-- de todos os funcionários?
select * from employees
where salary > (select avg (salary) from employees);



-- Um detalhe importante sobre a subquery acima é que ela é executada de dentro pra fora.
-- Primeiro é executado a query mais interna, para só depois executar a query mais externa.
-- Dessa forma, não existe nenhuma dependência da query interna em relação à query externa.
-- Ela é calculada de forma independente.
-- Em alguns casos, no entanto, a query mais interna depende da query externa.


