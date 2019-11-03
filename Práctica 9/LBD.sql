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