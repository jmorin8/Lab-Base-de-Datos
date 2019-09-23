create table persona(
id int not null,
idnombre int not null,
iddomicilio int not null,
edad int not null,
idsexo int not null
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
idcolonia int not null,
domiciliocompleto as (calle+' '+numint+' '+numex+', '+idcolonia+', '+idestado),
constraint pk_iddomicilio primary key(id desc)
);

create table colonia(
id int identity(1,1) not null,
nombre varchar(max) not null,
idciudad int not null,
constraint pk_idcolonia primary key(id desc)
);

create table ciudad(
id int identity(1,1) not null,
nombre varchar(max) not null,
idciudad int not null,
constraint pk_idciudad primary key(id desc)
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

alter table nombre
add constraint rel_nombre_persona foreign key (idnombre) references persona(id);

alter table domicilio
add constraint rel_domicilio_persona foreign key (iddomicilio) references persona(id);

alter table sexo
add constraint rel_sexo_persona foreign key (idsexo) references persona(id);

alter table estado
add constraint rel_estado_ciudad foreign key (idestado) references ciudad(id);

alter table cudad
add constraint rel_ciudad_colonia foreign key (idciudad) references colonia(id);

alter table cudad
add constraint rel_colonia_domicilio foreign key (idcolonia) references domicilio(id);

alter table persona
add constraint uc_persona unique (id,idnombre,iddomicilio,idsexo);

alter table sexo
add constraint uc_sexo unique (id,sexo);

alter table nombre
add constraint uc_nombre unique (id);

alter table domicilio
add constraint uc_domicilio unique (id,idcolonia);

alter table colonia
add constraint uc_colonia unique (id,idciudad);

alter table ciudad
add constraint uc_ciudad unique (id,idestado);

alter table estado
add constraint uc_estado unique (id);