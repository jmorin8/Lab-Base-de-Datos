create table persona(
id int not null,
id_nombre int not null,
id_domicilio int not null,
edad int not null,
id_sexo int not null
);

create table nombre(
id int identity(1,1) not null,
nombre varchar(15) not null,
appat varchar(15) not null,
apmat varchar(15) not null,
nombrecompleto as (nombre+' '+appat+' '+apmat),
constraint pk_idnombre primary key(id desc)
);

create table domicilio(
id int identity(1,1) not null,
calle varchar (max) not null,
numint varchar(4) not null,
numex varchar(4) null,
id_colonia int not null,
id_estado int not null,
domiciliocompleto as (calle+' '+numint+' '+numex+', '+idcolonia+', '+idestado),
constraint pk_iddomicilio primary key(id desc)
);

create table colonia(
id int identity(1,1) not null,
nombre varchar(max) not null,
id_ciudad int not null,
constraint pk_idcolonia primary key(id desc)
);

create table estado
(
id int identity(1,1)  not null,
nombre varchar(max) not null,
constraint pk_idestado primary key(id desc)

create table sexo
(
id int not null,
sexo varchar(9)
constraint pk_idsexo primary key (id desc)
);

create index nombre on nombre (id,nombrecompleto desc);
create index domicilio on domicilio (id,domiciliocompleto desc);