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