--1#-clausa-union
--una forma de unir resultados
select * from continent where "name" like '%America%'
union
select * from continent where code in (3,5)
order by "name" asc;
--nota: tienen que tener el mismo numero de columnas y el mismo orden

--2#-clausula-where
--hacer union por where
select c.name as pais ,c2.name as continente
from country c,continent c2  
where c.continent  = c2.code 
order by c2.name ;
--hacer uniones por el where puede llegar a ser volatil en casos de no especificarlo

--3#-clausula-inner-join
--solo muestra los datos que se relacionan en la tabla a y b 
select c.name as pais ,c2.name as continente
from country c inner join continent c2  on c.continent = c2.code 
order by c2.name ;

--Alterar secuencias
alter sequence 'sequenceName' restart with 8;

select * from continent c ;
insert into continent values(9,'South Oceania')
