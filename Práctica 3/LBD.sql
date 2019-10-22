create database LBD;

use LBD;

drop database LBD;

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

select * from persona;
select * from nombre;

alter table persona
add constraint rel_nombre_persona foreign key (idnombre) references nombre(idnombre);

alter table persona
add constraint rel_domicilio_persona foreign key (iddomicilio) references domicilio(iddomicilio);

alter table persona
add constraint rel_sexo_persona foreign key (idsexo) references sexo(idsexo);

alter table ciudad
add constraint rel_estado_ciudad foreign key (idestado) references estado(idestado);

alter table colinia
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