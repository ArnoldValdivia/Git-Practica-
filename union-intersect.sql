create table corrupcion (
	entidad varchar(10),
	upm varchar(10),
	viv varchar(10),
	Hogar varchar(10),
	Resul_H varchar(10), 
	Renglon varchar(10), 
	Aream varchar(10), 
	AP4_1 varchar(10),
	AP4_2_08 varchar(10),
	FAC_ELE int
)
copy corrupcion from 'D:\Sci-AABDD\envipe2015\tper_vic_agua.csv' using delimiters ',' csv header; 

select * from corrupcion 

select count(*) from corrupcion 

select sum(fac_ele)  from corrupcion where AP4_2_08 = '1' and resul_h = 'A'

select count(*)  from corrupcion where AP4_2_08 = '0'

-- sumar FACTORES DE ELECCION SIEMPRE Y CUANDO SEA DE PERSONAS INTERESADAS 

select sum(fac_ele) from corrupcion where ap4_2_08 = '1'

-------
create table narcotrafico ( 
entidad varchar(10),
	upm varchar(10),
	viv varchar(10),
	Hogar varchar(10),
	Resul_H varchar(10), 
	Renglon varchar(10), 
	Aream varchar(10), 
	AP4_1 varchar(10),
	AP4_2_03 varchar(10),
	FAC_ELE int
)

copy narcotrafico from 'D:\Sci-AABDD\envipe2015\tper_vic_narcotrafico.csv' using delimiters ',' csv header;

select count(*) from narcotrafico
---UNION DE PERSONAS QUE LE INTERESAN EL AGUA Y EL NARCOTRAFICO
create table corr_narc 
as
select entidad,upm,viv,hogar,renglon,FAC_ELE from narcotrafico where AP4_2_03 = '1'
union 
select entidad,upm,viv,hogar,renglon,FAC_ELE from corrupcion where AP4_2_08 = '1'

select SUM(FAC_ELE) from corr_narc

---INTERSECCION DE PERSONAS QUE LE INTERESAN EL AGUA Y EL NARCOTRAFICO
 create table corr_y_narc 
as
select entidad,upm,viv,hogar,renglon,FAC_ELE from narcotrafico where AP4_2_03 = '1'
INTERSECT
select entidad,upm,viv,hogar,renglon,FAC_ELE from corrupcion where AP4_2_08 = '1'

select SUM(FAC_ELE) from corr_y_narc

-- except
 create table corr_sin_narc 
as
select entidad,upm,viv,hogar,renglon,FAC_ELE from narcotrafico where AP4_2_03 = '1'
EXCEPT 
select entidad,upm,viv,hogar,renglon,FAC_ELE from corrupcion where AP4_2_08 = '1'

select SUM(FAC_ELE) from corr_SIN_narc
