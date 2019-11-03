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