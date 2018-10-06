INSERT INTO pais VALUES (5,'México');
INSERT into equipo VALUES (11,'UNAM',5);

#1
select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
d.descripcion_division, f.id_factura, f.total_factura
from cat_cliente c
left outer join cat_division d on c.id_division=d.id_division
left outer join factura f on f.id_cliente=c.id_cliente;

#2
select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
d.descripcion_division, p.id_pago, p.importe_pago
from cat_cliente c
left outer join cat_division d on c.id_division=d.id_division
left outer join pago p on p.id_cliente=c.id_cliente;

#3 
#GRANT CREATE VIEW TO udiplo;
create or replace view vw_ingresos
	as  
	select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
	d.descripcion_division,  f.total_factura fac, 0 pago
	from cat_cliente c
	left outer join cat_division d on c.id_division=d.id_division
	left outer join factura f on f.id_cliente=c.id_cliente
	union
	select c.id_cliente, c.razon_social_cliente, c.id_division, c.dias_credito_cliente,
	d.descripcion_division, 0 fac, p.importe_pago pago
	from cat_cliente c
	left outer join cat_division d on c.id_division=d.id_division
	left outer join pago p on p.id_cliente=c.id_cliente
WITH read only;

#4 
select razon_social_cliente, sum(fac) as facturado, sum(pago) as pagado,
sum(fac)-sum(pago) as saldo
from vw_ingresos
group by razon_social_cliente
order by 1;

#5
select t.id_equipo, t.id_lugar, p.id_pais, desc_pais,
from torneo t
left outer join pais p
on t.id_pais=p.id_pais

#6
select e.desc_equipo, A.finales as finales, nvl(B.primeros,0) as primeros,
 nvl(C.segundos,0) as segundos from 
(select id_equipo, count(id_equipo) as finales 
from torneo
group by id_equipo) A
left outer join 
(select id_equipo, count(id_equipo) as primeros
from torneo
where id_lugar = 1
group by id_equipo) B
on A.id_equipo=B.id_equipo
left outer join 
(select id_equipo, count(id_equipo) as segundos
from torneo
where id_lugar = 2
group by id_equipo) C
on A.id_equipo=C.id_equipo
left outer join 
equipo e
on A.id_equipo=e.id_equipo
order by 3 desc, 2 desc;



JLOC
/*8.*/

select e.desc_equipo
FROM (select id_equipo, count(id_equipo) as primeros
from torneo
where id_lugar = 1
group by id_equipo) B
LEFT OUTER JOIN equipo e
ON B.id_equipo=e.id_equipo
WHERE B.primeros>=3
ORDER by 1;
