CREATE TABLE modulo_victimizacion(
    entidad varchar(2),
    viv varchar(5),  --numero de vivienda
    hogar varchar(5),  
    upm varchar(5),  --unidada primaria de muestreo
    renglon varchar(20),
    tipo_delito int,  --nivel de agravio
    num_delito int,  --# veces del agravio
    nombre varchar(50),
    apellido varchar(50), 
    perdida int  --valor de la pérdida 
)


select * from modulo_victimizacion 

INSERT INTO modulo_victimizacion(entidad, viv, hogar, upm, renglon, tipo_delito, num_delito, nombre, apellido, perdida)
VALUES ('01','15','03','15','10',3, 1, 'Luis', 'Miranda',2000),
       ('01','15','03','15','10',3, 2, 'Luis', 'Miranda',3000),
       ('02','20','13','10','03',4, 1, 'Oscar', 'Ruiz',1000),
       ('09','16','11','05','01',5, 1, 'Raul', 'Ortiz',4500),
       ('32','12','11','02','04',2, 1, 'Luisa', 'Ortiz',300),
       ('32','12','11','02','04',3, 1, 'Luisa', 'Ortiz',500)
      
	  
insert into modulo_victimizacion values ('01','01','01','01','01',6,1,'Jose','Uribe',5000)

select nombre from modulo_victimizacion where nombre like 'L%'

SELECT * FROM modulo_victimizacion WHERE nombre LIKE '%u%s%'

SELECT * FROM modulo_victimizacion WHERE nombre LIKE 'L%s_'

SELECT * FROM modulo_victimizacion WHERE nombre LIKE 'O%c__'

SELECT * FROM modulo_victimizacion WHERE nombre iLIKE 'l%s_'

select * from modulo_victimizacion where entidad = '01'

select * from modulo_victimizacion order by nombre desc  

select * from modulo_victimizacion order by nombre asc, apellido desc, perdida desc

select * from modulo_victimizacion where perdida > 1000 order by tipo_delito desc

SELECT * FROM modulo_victimizacion WHERE perdida >= 2000 AND entidad = '01';

select * from modulo_victimizacion where perdida > 300 and perdida < 3000

SELECT * FROM modulo_victimizacion WHERE perdida <> 3000;

select * from modulo_victimizacion where tipo_delito in (2,3)  -- equivale a usar OR

select * from modulo_victimizacion where not perdida = 5000

select * from modulo_victimizacion limit 3

select * from modulo_victimizacion offset 0  --el conteo comienza desde cero

select * from modulo_victimizacion where perdida between 500 and 3000 

select * from modulo_victimizacion where nombre ilike 'luis%' and apellido ilike '%r%d%'

---- Tarea sesión #02 "CREACION DE VISTAS "------
create or replace view vista_1 
as select entidad, nombre, apellido, perdida from modulo_victimizacion 
--comprobación de datos 
select * from vista_1
--eliminación de vista
drop view if exists vista_1 


---- Tarea sesión #02 "CREACION DE UNA TABLA A PARTIR DE UNA CONSULTA" -----
create table vista_2
as select entidad, tipo_delito, nombre, apellido 
from modulo_victimizacion
--comprobacion de datos
select * from vista_2
-- eliminacion de tabla
drop if exists vista_2 

-- Tarea sesión #03 "CREACION DE UNA FUNCION QUE DEVUELVE LA MAXIMA PERDIDA MEDIANTE UN NOMBRE"
create or replace function maxperdida(int  ) returns int 
as 
$$ 
select perdida from modulo_victimizacion order by nombre desc limit 1
$$
language sql

drop function maxperdida

select maxperdida(1)

