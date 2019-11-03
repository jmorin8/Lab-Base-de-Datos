create database LBD;
use LBD;

create table persona(
idpersona int not null,
idnombre int not null,
iddomicilio int not null,
edad int not null,
idsexo int not null
constraint pk_idpersona primary key(idpersona desc)
);

create table nombre(
idnombre int identity(1,1) not null,
nombre varchar(15) not null,
appat varchar(15) not null,
apmat varchar(15) not null,
nombrecompleto as (nombre+' '+appat+' '+apmat),
constraint pk_idnombre primary key(idnombre desc)
);

create table domicilio(
iddomicilio int identity(1,1) not null,
calle varchar (max) not null,
numint varchar(4) not null,
numex varchar(4) null,
idcolonia int not null,
domiciliocompleto as (calle+' '+numint+' '+numex+', '+idcolonia),
constraint pk_iddomicilio primary key(iddomicilio desc)
);

create table colonia(
idcolonia int identity(1,1) not null,
nombre varchar(max) not null,
idciudad int not null,
constraint pk_idcolonia primary key(idcolonia desc)
);

create table ciudad(
idciudad int identity(1,1) not null,
nombre varchar(max) not null,
idestado int not null,
constraint pk_idciudad primary key(idciudad desc)
);

create table estado
(
idestado int identity(1,1)  not null,
nombre varchar(max) not null,
constraint pk_idestado primary key(idestado desc)
);

create table sexo
(
idsexo int not null,
sexo varchar(9)
constraint pk_idsexo primary key (idsexo desc)
);

create index nombre on nombre (idnombre,nombrecompleto desc);
create index domicilio on domicilio (iddomicilio,domiciliocompleto desc);

alter table persona
add constraint rel_nombre_persona foreign key (idnombre) references nombre(idnombre);

alter table persona
add constraint rel_domicilio_persona foreign key (iddomicilio) references domicilio(iddomicilio);

alter table persona
add constraint rel_sexo_persona foreign key (idsexo) references sexo(idsexo);

alter table ciudad
add constraint rel_estado_ciudad foreign key (idestado) references estado(idestado);

alter table colonia
add constraint rel_ciudad_colonia foreign key (idciudad) references ciudad(idciudad);

alter table domicilio
add constraint rel_colonia_domicilio foreign key (idcolonia) references colonia(idcolonia);

alter table persona
add constraint uc_persona unique (idpersona);

alter table sexo
add constraint uc_sexo unique (idsexo,sexo);

alter table nombre
add constraint uc_nombre unique (idnombre);

alter table domicilio
add constraint uc_domicilio unique (iddomicilio);

alter table colonia
add constraint uc_colonia unique (idcolonia);

alter table ciudad
add constraint uc_ciudad unique (idciudad,idestado);

alter table estado
add constraint uc_estado unique (idestado);

insert into sexo(sexo) values('Masculino');
insert into sexo(sexo) values('Femenino');
insert into sexo(sexo) values('Masculino');
insert into sexo(sexo) values('Femenino');
insert into estado(nombre) values('Aguascalientes');
insert into estado(nombre) values('Baja California');
insert into estado(nombre) values('Baja California Sur');
insert into estado(nombre) values('Campeche');
insert into estado(nombre) values('Chiapas');
insert into estado(nombre) values('Chihuahua');
insert into estado(nombre) values('Ciudad de Mexico');
insert into estado(nombre) values('Coahuila de Zaragoza');
insert into estado(nombre) values('Colima');
insert into estado(nombre) values('Durango');
insert into estado(nombre) values('Guanajuato');
insert into estado(nombre) values('Guerrero');
insert into estado(nombre) values('Hidalgo');
insert into estado(nombre) values('Jalisco');
insert into estado(nombre) values('Mexico');
insert into estado(nombre) values('Michoacan de Ocampo');
insert into estado(nombre) values('Morelos');
insert into estado(nombre) values('Nayarit');
insert into estado(nombre) values('Nuevo Leon');
insert into estado(nombre) values('Oaxaca');
insert into estado(nombre) values('Puebla');
insert into estado(nombre) values('Queretaro Arteaga');
insert into estado(nombre) values('Quintana Roo');
insert into estado(nombre) values('San Luis Potosi');
insert into estado(nombre) values('Sinaloa');
insert into estado(nombre) values('Sonora');
insert into estado(nombre) values('Tabasco');
insert into estado(nombre) values('Tamaulipas');
insert into estado(nombre) values('Tlaxcala');
insert into estado(nombre) values('Veracruz');
insert into estado(nombre) values('Yucatán');
insert into estado(nombre) values('Zacatecas');
insert into ciudad (nombre,idestado) values ('Aguascalientes',1);
insert into ciudad (nombre,idestado) values ('Mexicali',2);
insert into ciudad (nombre,idestado) values ('La Paz',3);
insert into ciudad (nombre,idestado) values ('Campeche',4);
insert into ciudad (nombre,idestado) values ('Tuxtla Gutierrez',5);
insert into ciudad (nombre,idestado) values ('Chihuahua',6);
insert into ciudad (nombre,idestado) values ('Ciudad de Mexico',7);
insert into ciudad (nombre,idestado) values ('Saltillo',8);
insert into ciudad (nombre,idestado) values ('Colima',9);
insert into ciudad (nombre,idestado) values ('Victoria de Durango',10);
insert into ciudad (nombre,idestado) values ('Guanajuato',11);
insert into ciudad (nombre,idestado) values ('Chilpancingo de los Bravo',12);
insert into ciudad (nombre,idestado) values ('Pachuca de Soto',13);
insert into ciudad (nombre,idestado) values ('Guadalajara',14);
insert into ciudad (nombre,idestado) values ('Toluca de Lerdo',15);
insert into ciudad (nombre,idestado) values ('Morelia',16);
insert into ciudad (nombre,idestado) values ('Cuernavaca',17);
insert into ciudad (nombre,idestado) values ('Tepic',18);
insert into ciudad (nombre,idestado) values ('Monterrey',19);
insert into ciudad (nombre,idestado) values ('Oaxaca de Juarez',20);
insert into ciudad (nombre,idestado) values ('H. Puebla de Zaragoza',21);
insert into ciudad (nombre,idestado) values ('Santiago de Queretaro',22);
insert into ciudad (nombre,idestado) values ('Cd. Chetumal',23);
insert into ciudad (nombre,idestado) values ('San Luis Potosi',24);
insert into ciudad (nombre,idestado) values ('Culiacan Rosales',25);
insert into ciudad (nombre,idestado) values ('Hermosillo',26);
insert into ciudad (nombre,idestado) values ('Villahermosa',27);
insert into ciudad (nombre,idestado) values ('Ciudad Victoria',28);
insert into ciudad (nombre,idestado) values ('Tlaxcala de Xicohtencatl',29);
insert into ciudad (nombre,idestado) values ('Xalapa de Enriquez',30);
insert into ciudad (nombre,idestado) values ('Merida',31);
insert into ciudad (nombre,idestado) values ('Zacatecas',32);
insert into nombre(nombre,appat,apmat) values ('Isarel','Limones','Vieyra');
insert into nombre(nombre,appat,apmat) values ('Samuel','Limones','Vieyra');
insert into nombre(nombre,appat,apmat) values ('Emmanuel','Limones','Vieyra');
insert into nombre(nombre,appat,apmat) values ('Isarel','Limones','Vieyra');
insert into nombre(nombre,appat,apmat) values ('Samuel','Limones','Vieyra');
insert into nombre(nombre,appat,apmat) values ('Emmanuel','Limones','Vieyra');
insert into colonia(nombre,codigopostal,idciudad) values('Las Brisas',20010,1);
insert into colonia(nombre,codigopostal,idciudad) values('Nueva Esperanza',21050,2);
insert into colonia(nombre,codigopostal,idciudad) values('Lomas de Palmira',23010,3);
insert into colonia(nombre,codigopostal,idciudad) values('San Joaquín',24020,4);
insert into colonia(nombre,codigopostal,idciudad) values('Rosario Poniente',29014,5);
insert into colonia(nombre,codigopostal,idciudad) values('Cuarteles',31020,6);
insert into colonia(nombre,codigopostal,idciudad) values('Atlántida',04370,7);
insert into colonia(nombre,codigopostal,idciudad) values('Loma Linda',25016,8);
insert into colonia(nombre,codigopostal,idciudad) values('Las Palmas',28017,9);
insert into colonia(nombre,codigopostal,idciudad) values('Revolución',34892,10);
insert into colonia(nombre,codigopostal,idciudad) values('La Bufa',36094,11);
insert into colonia(nombre,codigopostal,idciudad) values('Azteca',39010,12);
insert into colonia(nombre,codigopostal,idciudad) values('Los Cedros',42033,13);
insert into colonia(nombre,codigopostal,idciudad) values('El Jaguey',44249,14);
insert into colonia(nombre,codigopostal,idciudad) values('San Juanito',56120,15);
insert into colonia(nombre,codigopostal,idciudad) values('Cosmos',58050,16);
insert into colonia(nombre,codigopostal,idciudad) values('El Veladero',62243,17);
insert into colonia(nombre,codigopostal,idciudad) values('Reforma',63038,18);
insert into colonia(nombre,codigopostal,idciudad) values('Real Cumbres',64346,19);
insert into colonia(nombre,codigopostal,idciudad) values('Revolución',68010,20);
insert into colonia(nombre,codigopostal,idciudad) values('Polideportivo',72014,21);
insert into colonia(nombre,codigopostal,idciudad) values('Diligencias',76020,22);
insert into colonia(nombre,codigopostal,idciudad) values('Maya Pax',77760,23);
insert into colonia(nombre,codigopostal,idciudad) values('La Matamoros',78100,24);
insert into colonia(nombre,codigopostal,idciudad) values('El Caiman',81902,25);
insert into colonia(nombre,codigopostal,idciudad) values('El Alamito',84640,26);
insert into colonia(nombre,codigopostal,idciudad) values('El Parnaso',86495,27);
insert into colonia(nombre,codigopostal,idciudad) values('Bellavista',88179,28);
insert into colonia(nombre,codigopostal,idciudad) values('Los Volcanes',90014,29);
insert into colonia(nombre,codigopostal,idciudad) values('Solidaridad',91013,30);
insert into colonia(nombre,codigopostal,idciudad) values('Itzimna',97100,31);
insert into colonia(nombre,codigopostal,idciudad) values('De Olivos',98024,32);

update ciudad set nombre='Coyoacan' where idciudad=7;
update ciudad set nombre='Vicente Guerrero' where idciudad=11;
update ciudad set nombre='Texcoco' where idciudad=15;
update ciudad set nombre='Puebla' where idciudad=21;
update ciudad set nombre='Xalapa' where idciudad=30;

delete sexo where idsexo=1002;
delete sexo where idsexo=1003;
delete nombre where idnombre=1003;
delete nombre where idnombre=1004;
delete nombre where idnombre=1005;

select c.nombre as ciudad,e.nombre as estado
from ciudad c
inner join estado e on c.idestado=e.idestado;

select c.nombre as ciudad,e.nombre as estado
from ciudad c
left join estado e on c.idestado=e.idestado
where c.nombre like '%H%';

select c.nombre as ciudad,e.nombre as estado
from estado e
right join ciudad c on e.idestado=c.idestado
where e.nombre like '%P%';

select co.nombre as colonia, ci.nombre as ciudad
from colonia co
inner join ciudad ci on co.idciudad=ci.idciudad;

select co.nombre as colonia,co.codigopostal as cp, ci.nombre as ciudad
from ciudad ci
left join colonia co on ci.idciudad=co.idciudad
where co.codigopostal like '%7%';

select c.nombre as ciudad,e.nombre as estado
from ciudad c
inner join estado e on c.idestado=e.idestado
order by c.nombre;

select c.nombre as ciudad,e.nombre as estado
from ciudad c
left join estado e on c.idestado=e.idestado
where c.nombre like '%B%'
order by c.nombre desc;

select c.nombre as ciudad,e.nombre as estado
from estado e
right join ciudad c on e.idestado=c.idestado
where e.nombre like '%N%'
order by e.idestado asc;

select co.nombre as colonia, ci.nombre as ciudad
from colonia co
inner join ciudad ci on co.idciudad=ci.idciudad
order by ci.nombre;

select co.nombre as colonia,co.codigopostal as cp, ci.nombre as ciudad
from ciudad ci
left join colonia co on ci.idciudad=co.idciudad
order by co.codigopostal desc;

create view estados_ciudades
as
select c.nombre as ciudad,e.nombre as estado
from ciudad c
inner join estado e on c.idestado=e.idestado;

create view ciudades_colonias
as
select co.nombre as colonia, ci.nombre as ciudad
from colonia co
inner join ciudad ci on co.idciudad=ci.idciudad;

create view estados_ciudades_colonias
as
select co.nombre as colonia, ci.nombre as ciudad, e.nombre as estado
from colonia co
inner join ciudad ci on co.idciudad=ci.idciudad
inner join estado e on ci.idestado=e.idestado;

create view ciudades_colonias_cp
as
select co.nombre as colonia,co.codigopostal as cp, ci.nombre as ciudad
from ciudad ci
left join colonia co on ci.idciudad=co.idciudad;

create view estados_ciudades_colonias_cp
as
select co.nombre as colonia,co.codigopostal as cp, ci.nombre as ciudad, e.idestado as estado
from ciudad ci
inner join colonia co on ci.idciudad=co.idciudad
inner join estado e on ci.idestado=e.idestado;

create trigger no_insertar_colonia
on colonia
for insert
as
if (select idciudad from colonia) <0
begin
	print 'Id de ciudad no existe'
	rollback
end;
go

create function cpEstandar
(
@cp varchar(5)
)
returns varchar(10)
as
begin
declare @cpEstandar varchar(10)
set @cpEstandar=(case len(@cpEstandar) when 1 then '0000'+@cpEstandar
									   when 2 then '000'+@cpEstandar
									   when 3 then '0'+@cpEstandar
									   when 4 then '0'+@cpEstandar
									   else
									   @cpEstandar
				end)
return @cpEstandar
end;
go

create procedure ciudades_estados
as
select c.nombre as ciudad,e.nombre as estado
from ciudad c
inner join estado e on c.idestado=e.idestado;
go

create procedure ciudades_estados_ordenados_AZ
as
select c.nombre as ciudad,e.nombre as estado
from ciudad c
inner join estado e on c.idestado=e.idestado
order by c.nombre asc;
go

create procedure colonias_ciudades
as
select co.nombre as colonia, ci.nombre as ciudad
from colonia co
inner join ciudad ci on co.idciudad=ci.idciudad;
go

create procedure colonias_ciudades_ordenados_ZA
as
select co.nombre as colonia, ci.nombre as ciudad
from colonia co
inner join ciudad ci on co.idciudad=ci.idciudad
order by ci.nombre desc;
go

create procedure colonias_cp_ciudades_estados_ordenados_AZ
as
select co.nombre as colonia,co.codigopostal as cp, ci.nombre as ciudad, e.nombre as estado
from ciudad ci
left join colonia co on ci.idciudad=co.idciudad
left join estado e on ci.idestado=e.idestado
order by e.nombre asc;
go