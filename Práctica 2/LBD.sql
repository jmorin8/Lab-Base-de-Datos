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
