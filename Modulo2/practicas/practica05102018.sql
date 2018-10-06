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
create or replace view vista1
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
from vista1
group by razon_social_cliente
order by 1;